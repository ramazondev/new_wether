import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icons.dart';
import '../bloc/main_bloc.dart';
import '../widgets/stat_column.dart';
import '../widgets/w_function.dart';
import '../widgets/w_list.dart';
import '../widgets/w_week.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<MainBloc>().add(ChangeRegionEvent(
          regionName: regions[4]['name'].toString(),
          onError: () {},
          onSuccess: () {},
          slugName: regions[4]['timezone'].toString(),
          lat: regions[4]['latitude'].toString(),
          long: regions[4]['longitude'].toString(),
        ));
    super.initState();
  }


  String getWeatherDescription(int code) {
    if (code == 0) {
      return 'Clear sky';
    } else if ([1, 2, 3].contains(code)) {
      return 'Mainly clear, partly cloudy, and overcast';
    } else if ([45, 48].contains(code)) {
      return 'Fog and depositing rime fog';
    } else if ([51, 53, 55].contains(code)) {
      return 'Drizzle: Light, moderate, and dense intensity';
    } else if ([56, 57].contains(code)) {
      return 'Freezing Drizzle: Light and dense intensity';
    } else if ([61, 63, 65].contains(code)) {
      return 'Rain: Slight, moderate and heavy intensity';
    } else if ([66, 67].contains(code)) {
      return 'Freezing Rain: Light and heavy intensity';
    } else if ([71, 73, 75].contains(code)) {
      return 'Snow fall: Slight, moderate, and heavy intensity';
    } else if (code == 77) {
      return 'Snow grains';
    } else if ([80, 81, 82].contains(code)) {
      return 'Rain showers: Slight, moderate, and violent';
    } else if ([85, 86].contains(code)) {
      return 'Snow showers slight and heavy';
    } else if (code == 95) {
      return 'Thunderstorm: Slight or moderate';
    } else if ([96, 99].contains(code)) {
      return 'Thunderstorm with slight and heavy hail';
    } else {
      return 'Unknown weather code';
    }
  }

  String formatDate(String dateStr) {
    final date = DateTime.parse(dateStr);
    final monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    DateTime now = DateTime.now();
    return '${monthNames[now.month - 1]} ${now.day},\n${now.year} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              foregroundDecoration: BoxDecoration(
                color: AppColors.blackCl.withOpacity(0.5),
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteCl,
                image: DecorationImage(
                  image: AssetImage(state.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.whiteCl),
            backgroundColor: Colors.transparent,
            title: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    state.regionName,
                    style: const TextStyle(
                      color: AppColors.whiteCl,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on_rounded,
                color: AppColors.whiteCl,
              ),
            ),
          ),
          endDrawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.5,
            backgroundColor: Colors.white,
            child: ListView(
              children: [
                ...buildRegionList(context),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      state.status.isInitial || state.status.isInProgress ? "Loading..." : formatDate(state.weatherModel.daily.time[0]),
                      style: const TextStyle(
                        color: AppColors.whiteCl,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    state.status.isInProgress || state.status.isInitial
                        ? const CircularProgressIndicator()
                        : Image.asset(
                            width: 100,
                            getWeatherIcon(state.weatherModel.daily.weatherCode[0]),
                            height: 100,
                          ),
                    if (!(state.status.isInProgress || state.status.isInitial))
                      Center(
                        child: Text(
                          getWeatherDescription(state.weatherModel.daily.weatherCode[0]),
                          style: const TextStyle(
                            color: AppColors.whiteCl,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.status.isInitial || state.status.isInProgress ? "0" : (state.weatherModel.daily.temperature2MMax[0].floor()).toString(),
                          style: const TextStyle(
                            color: AppColors.whiteCl,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '°C',
                          style: TextStyle(
                            color: AppColors.whiteCl,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 2),
                    state.status.isInProgress || state.status.isInitial
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StatColumn(
                                label: 'HUMIDITY',
                                imagePath: AppIcons.humidity,
                                value: '${state.weatherModel.daily.precipitationProbabilityMean[0].toString()} %',
                              ),
                              StatColumn(
                                imagePath: AppIcons.wind,
                                label: 'WiND',
                                value: '${state.weatherModel.daily.windSpeed10mMax[0].toString()} km/h',
                              ),
                              StatColumn(
                                imagePath: AppIcons.feelsLike,
                                label: 'FEELS LIKE',
                                value: '${(state.weatherModel.daily.apparentTemperatureMax[0].floor()).toString()}°',
                              ),
                            ],
                          ),
                    const SizedBox(height: 18),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(24)),
                        color: const Color(0xFF535353).withOpacity(0.5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
                        child: DefaultTextStyle(
                          style: const TextStyle(color: AppColors.whiteCl),
                          child: state.status.isInitial || state.status.isInProgress
                              ? const SizedBox(
                                  height: 300,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    for (int i = 1; i < 5; i++) buildOneDay(state.weatherModel, i),
                                  ],
                                ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

}
