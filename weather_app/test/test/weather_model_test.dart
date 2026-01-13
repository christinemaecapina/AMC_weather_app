import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/models/weather.dart';

void main() {
  group('Weather.fromJson', () {
    test('should correctly parse a JSON response from OpenWeatherMap', () {
      // A realistic sample JSON response from the OpenWeatherMap API for Manila.
      final jsonString = '''
      {
        "coord": {
          "lon": 120.98,
          "lat": 14.6
        },
        "weather": [
          {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04n"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 28.3,
          "feels_like": 32.8,
          "temp_min": 27.78,
          "temp_max": 29,
          "pressure": 1010,
          "humidity": 79
        },
        "visibility": 10000,
        "wind": {
          "speed": 2.24,
          "deg": 90
        },
        "clouds": {
          "all": 75
        },
        "dt": 1673562911,
        "sys": {
          "type": 2,
          "id": 2009012,
          "country": "PH",
          "sunrise": 1673562013,
          "sunset": 1673602922
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      }
      ''';

      // Decode the JSON string into a Map.
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // Create a Weather object using the fromJson factory constructor.
      final weather = Weather.fromJson(jsonMap);

      // Assert that the properties of the Weather object match the JSON data.
      expect(weather.city, 'Manila');
      expect(weather.temperature, 28.3);
      expect(weather.description, 'Clouds');
      expect(weather.humidity, 79);
      expect(weather.windSpeed, 2.24);
    });
  });
}
