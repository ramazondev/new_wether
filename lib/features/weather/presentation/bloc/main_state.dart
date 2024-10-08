part of 'main_bloc.dart';

class MainState extends Equatable {
  final String regionName;
  final String imagePath;
  final WeatherModel weatherModel;
  final FormzSubmissionStatus status;

  const MainState({
    this.regionName = 'Location',
    this.imagePath = AppImages.tashkent_city,
    this.weatherModel = const WeatherModel(),
    this.status = FormzSubmissionStatus.initial,
  });


  @override
  List<Object> get props => [
        regionName,
        imagePath,
        weatherModel,
        status,
      ];

  MainState copyWith({
    String? regionName,
    String? imagePath,
    WeatherModel? weatherModel,
    FormzSubmissionStatus? status,
  }) {
    return MainState(
      regionName: regionName ?? this.regionName,
      imagePath: imagePath ?? this.imagePath,
      weatherModel: weatherModel ?? this.weatherModel,
      status: status ?? this.status,
    );
  }
}
