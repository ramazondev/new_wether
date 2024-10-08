import 'package:flutter/cupertino.dart';

class LocationModel {
  final String name;
  final String country;
  final String region;
  final String lat;
  final String lon;
  final String timezoneId;
  final String localtime;
  final int localtimeEpoch;
  final String utcOffset;

  const LocationModel({
    this.name = '',
    this.country = '',
    this.region = '',
    this.lat = '',
    this.lon = '',
    this.timezoneId = '',
    this.localtime = '',
    this.localtimeEpoch = 0,
    this.utcOffset = '',
  });
  factory LocationModel.fromJson(Map<String,Object?>json){
    return LocationModel(
        name : json['name'] as String ? ?? '',
        country : json['country'] as String ? ?? '',
        region : json['region'] as String ? ?? '',
        lat : json['lat'] as String ? ?? '',
        lon : json['lon'] as String ? ?? '',
        timezoneId : json['timezone_id'] as String ? ?? '',
        localtime : json['localtime'] as String ? ?? '',
        localtimeEpoch : json['localtime_epoch'] as int ? ?? 0,
        utcOffset : json['utc_offset'] as String ? ?? '',
    );
  }
  Map<String, Object?> toJson() {
    return {
      'name': name,
      'country': country,
      'region': region,
      'lat': lat,
      'lon': lon,
      'timezone_id': timezoneId,
      'localtime': localtime,
      'localtime_epoch': localtimeEpoch,
      'utc_offset': utcOffset,
    };
  }

  @override
  String toString() {
    return 'LocationModel{'
        'name: $name, '
        'country: $country, '
        'region: $region, '
        'lat: $lat, '
        'lon: $lon, '
        'timezoneId: $timezoneId, '
        'localtime: $localtime, '
        'localtimeEpoch: $localtimeEpoch, '
        'utcOffset: $utcOffset'
        '}';
  }
}
