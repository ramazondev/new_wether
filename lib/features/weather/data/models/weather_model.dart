class WeatherModel {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final num utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final num elevation;
  final DailyUnits dailyUnits;
  final Daily daily;
  // final Minutely minutely;

  const WeatherModel({
    this.latitude = 0,
    this.longitude = 0,
    this.generationtimeMs = 0,
    this.utcOffsetSeconds = 0,
    this.timezone = '',
    this.timezoneAbbreviation = '',
    this.elevation = 0,
    this.dailyUnits = const DailyUnits(),
    this.daily = const Daily(),
  });

  Map<String, Object?> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationtimeMs,
      'utc_offset_seconds': utcOffsetSeconds,
      'timezone': timezone,
      'timezone_abbreviation': timezoneAbbreviation,
      'elevation': elevation,
      'daily_units': dailyUnits.toJson(),
      'daily': daily.toJson(),
    };
  }

  factory WeatherModel.fromJson(Map<String, Object?> json) {
    return WeatherModel(
      latitude: json['latitude'] as double? ?? 0,
      longitude: json['longitude'] as double? ?? 0,
      generationtimeMs: json['generationtime_ms'] as double? ?? 0,
      utcOffsetSeconds: json['utc_offset_seconds'] as num? ?? 0,
      timezone: json['timezone'] as String? ?? '',
      timezoneAbbreviation: json['timezone_abbreviation'] as String? ?? '',
      elevation: json['elevation'] as num? ?? 0,
      dailyUnits: DailyUnits.fromJson(json['daily_units'] as Map<String, Object?>? ?? {}),
      daily: Daily.fromJson(json['daily'] as Map<String, Object?>? ?? {}),
    );
  }
}

class Daily {
  final List<String> time;
  final List<double> temperature2MMax;
  final List<double> temperature2MMin;
  final List<double> precipitationSum;
  final List<double> windSpeed10mMax;
  final List<int> weatherCode;
  final List<int> precipitationProbabilityMean;
  final List<double> apparentTemperatureMax;


  const Daily({
    this.time = const [],
    this.temperature2MMax = const [],
    this.temperature2MMin = const [],
    this.precipitationSum = const [],
    this.windSpeed10mMax = const [],
    this.weatherCode = const [],
    this.precipitationProbabilityMean = const [],
    this.apparentTemperatureMax = const [],
  });

  Map<String, Object?> toJson() {
    return {
      'time': time,
      'temperature_2m_max': temperature2MMax,
      'temperature_2m_min': temperature2MMin,
      'precipitation_sum': precipitationSum,
      'wind_speed_10m_max': windSpeed10mMax,
      'weather_code': weatherCode,
      'precipitation_probability_mean': precipitationProbabilityMean,
      'apparent_temperature_max': apparentTemperatureMax
    };
  }

  factory Daily.fromJson(Map<String, Object?> json) {
    return Daily(
      time: List.from(json['time'] as List? ?? []),
      temperature2MMax: List.from(json['temperature_2m_max'] as List? ?? []),
      temperature2MMin: List.from(json['temperature_2m_min'] as List? ?? []),
      precipitationSum: List.from(json['precipitation_sum'] as List? ?? []),
      windSpeed10mMax: List.from(json['wind_speed_10m_max'] as List? ?? []),
      weatherCode: List.from(json['weather_code'] as List? ?? []),
      precipitationProbabilityMean: List.from(json['precipitation_probability_mean'] as List? ?? []),
      apparentTemperatureMax: List.from(json['apparent_temperature_max'] as List? ?? []),
    );
  }
}

class DailyUnits {
  final String time;
  final String temperature2MMax;
  final String temperature2MMin;
  final String precipitationSum;

  const DailyUnits({
    this.time = '',
    this.temperature2MMax = '',
    this.temperature2MMin = '',
    this.precipitationSum = '',
  });

  Map<String, Object?> toJson() {
    return {
      'time': time,
      'temperature_2m_max': temperature2MMax,
      'temperature_2m_min': temperature2MMin,
      'precipitation_sum': precipitationSum,
    };
  }

  factory DailyUnits.fromJson(Map<String, Object?> json) {
    return DailyUnits(
      time: json['time'] as String? ?? '',
      temperature2MMax: json['temperature_2m_max'] as String? ?? '',
      temperature2MMin: json['temperature_2m_min'] as String? ?? '',
      precipitationSum: json['precipitation_sum'] as String? ?? '',
    );
  }
}
