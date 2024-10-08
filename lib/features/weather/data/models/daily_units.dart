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
