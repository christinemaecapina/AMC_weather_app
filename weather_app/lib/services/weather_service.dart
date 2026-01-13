import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather.dart';
import 'package:flutter/foundation.dart';

class WeatherService {
  static const apiKey = '738422b2ccff37c37bdf9844d2c97305';
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

static Future<Weather> getWeather(String cityName) async {
  try {
    String url = '$baseUrl?q=$cityName&appid=$apiKey&units=metric';

    if (kIsWeb) {
      url='https://corsproxy.io/?' + Uri.encodeComponent(url);
    }

    final http.Response response = await http.get(Uri.parse(url),
      headers: {'Content_Type': 'application/json'},
    );

    if(response.statusCode ==200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Weather.fromJson(data);
    }
    else if (response.statusCode ==404) {
      throw Exception('City not found');
    }
    else {
      throw Exception('Failed to load weather data');
    }
    } catch (e) {
    throw Exception('Failed to load weather data: $e');

  }

}
}