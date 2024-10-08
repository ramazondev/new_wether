import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../models/weather_model.dart';

class ApiRepository {
  final Dio _dio = Dio()
    ..interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        error: true,
        request: true,
        responseHeader: true,
        enabled: true,
        compact: true,
      ),
    ]);

  final String _baseUrl = 'https://api.open-meteo.com';
  final String _apiKey = '2b077f3d7ab4f6ef81d504895780dc74';

  Future<WeatherModel> fetchWeather(String location, String lat, String long) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/v1/forecast',
        queryParameters: {
      'latitude': lat,
      'longitude': long,
      'daily': 'temperature_2m_max,temperature_2m_min,precipitation_sum,wind_speed_10m_max'
          ',weather_code,precipitation_probability_mean,apparent_temperature_max',
      'timezone': location,
      },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, Object?>;
        return WeatherModel.fromJson(data);
      } else {
        throw Exception('API dan malumot olishda xato: ${response.statusCode}');
      }
    } catch (e, s) {
      print('Xato: $e');
      print('Stack Trace: $s');
      throw Exception('Ukam ob-havoin chatoq sani: ${e.toString()}');
    }
  }
}
