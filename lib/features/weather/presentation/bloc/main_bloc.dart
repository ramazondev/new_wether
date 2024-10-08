import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:new_weather/core/theme/app_images.dart';
import 'package:new_weather/features/weather/data/models/weather_model.dart';

import '../../data/repository/api_repository.dart';

part 'main_event.dart';

part 'main_state.dart';

Map<String, String> images = {
  'Andijon': AppImages.andijon,
  'Farg\'ona': AppImages.fargana,
  'Namangan': AppImages.namangan,
  'Toshkent': AppImages.toshkent_vil,
  'Toshkent city': AppImages.tashkent_city,
  'Samarqand': AppImages.samarqand,
  'Buxoro': AppImages.buxora,
  'Qashqadaryo': AppImages.qashqadaryo,
  'Surxondaryo': AppImages.surxondaryo,
  'Navoiy': AppImages.navoiy,
  'Jizzax': AppImages.jizzax,
  'Sirdaryo': AppImages.sirdaryo,
  'Xorazm': AppImages.xorazm,
  'Qoraqalpog\'iston res': AppImages.qoraqalpoq,
};

class MainBloc extends Bloc<MainEvent, MainState> {
  final apiRepository = ApiRepository();

  MainBloc() : super(const MainState()) {
    on<ChangeRegionEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      WeatherModel? result;
      try {
        result = await apiRepository.fetchWeather(event.slugName, event.lat, event.long);
        event.onSuccess();
      } catch (e, s) {
        print(e);
        print(s);
        event.onError();
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
      if (result == null) return;

      emit(state.copyWith(
        regionName: event.regionName,
        weatherModel: result,
        status: FormzSubmissionStatus.success,
        imagePath: images[event.regionName] ?? AppImages.tashkent_city,
      ));
    });
  }
}
