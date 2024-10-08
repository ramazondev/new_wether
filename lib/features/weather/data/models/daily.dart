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
