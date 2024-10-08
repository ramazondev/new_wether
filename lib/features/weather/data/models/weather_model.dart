import 'package:new_weather/features/weather/data/models/daily.dart';
import 'package:new_weather/features/weather/data/models/daily_units.dart';

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


