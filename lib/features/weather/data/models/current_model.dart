class CurrentModel {
  final String observationTime;
  final int temperature;
  final int weatherCode;
  final List weatherIcons;
  final List weatherDescriptions;
  final int windSpeed;
  final int windDegree;
  final String windDir;
  final int pressure;
  final int precip;
  final int humidity;
  final int cloudcover;
  final int feelslike;
  final int uvIndex;
  final int visibility;
  final String isDay;

  const CurrentModel({
    this.observationTime = '',
    this.temperature = 0,
    this.weatherCode = 0,
    this.weatherIcons = const [],
    this.weatherDescriptions = const [],
    this.windSpeed = 0,
    this.windDegree = 0,
    this.windDir = '',
    this.pressure = 0,
    this.precip = 0,
    this.humidity = 0,
    this.cloudcover = 0,
    this.feelslike = 0,
    this.uvIndex = 0,
    this.visibility = 0,
    this.isDay = '',
  });

  factory CurrentModel.fromJson(Map<String, Object?> json) {
    return CurrentModel(
      observationTime: json['observation_time'] as String? ?? '',
      temperature: json['temperature'] as int? ?? 0,
      weatherCode: json['weather_code'] as int? ?? 0,
      weatherIcons: json['weather_icons'] as List? ?? [],
      weatherDescriptions: json['weather_descriptions'] as List? ?? [],
      windSpeed: json['wind_speed'] as int? ?? 0,
      windDegree: json['wind_degree'] as int? ?? 0,
      windDir: json['wind_dir'] as String? ?? '',
      pressure: json['pressure'] as int? ?? 0,
      precip: json['precip'] as int? ?? 0,
      humidity: json['humidity'] as int? ?? 0,
      cloudcover: json['cloudcover'] as int? ?? 0,
      feelslike: json['feelslike'] as int? ?? 0,
      uvIndex: json['uvIndex'] as int? ?? 0,
      visibility: json['visibility'] as int? ?? 0,
      isDay: json['is_day'] as String? ?? '0',
    );
  }


  Map<String, Object?> toJson() {
    return {
      'observation_time': observationTime,
      'temperature': temperature,
      'weather_code': weatherCode,
      'weather_icons': weatherIcons,
      'weather_descriptions': weatherDescriptions,
      'wind_speed': windSpeed,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure': pressure,
      'precip': precip,
      'humidity': humidity,
      'cloudcover': cloudcover,
      'feelslike': feelslike,
      'uv_index': uvIndex,
      'visibility': visibility,
      'is_day': isDay,
    };
  }
  @override
  String toString() {
    return 'CurrentModel{'
        'observationTime: $observationTime, '
        'temperature: $temperature, '
        'weatherCode: $weatherCode, '
        'weatherIcons: $weatherIcons, '
        'weatherDescriptions: $weatherDescriptions, '
        'windSpeed: $windSpeed, '
        'windDegree: $windDegree, '
        'windDir: $windDir, '
        'pressure: $pressure, '
        'precip: $precip, '
        'humidity: $humidity, '
        'cloudcover: $cloudcover, '
        'feelslike: $feelslike, '
        'uvIndex: $uvIndex, '
        'visibility: $visibility, '
        'isDay: $isDay,'
        '}';
  }
}
