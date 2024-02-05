import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '421686d2caaf431b820210417223110';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherData;
    try {
      //int id = await getCityId(cityName:cityName);
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7'
              '$baseUrl/current.json?key=$apiKey&q=$cityName&aqi=no');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      //var jsonData = data['forecast']['forecastday'][0]['day'];
      weatherData = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weatherData;
  }
}
