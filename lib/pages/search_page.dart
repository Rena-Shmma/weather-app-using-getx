import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/providers/weather_provider.dart';
import 'package:weather_api/servicces/weather_service.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi, Key? key}) : super(key: key);
  String? cityName;
  WeatherModel? weatherData;
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search a city'),
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              weatherData = weather;
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather!;
              updateUi!();
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                label: Text('search'),
                hintText: 'Enter a city',
                suffixIcon: GestureDetector(
                  onTap: () async {
                    // cityName=data;
                    WeatherService service = WeatherService();
                    WeatherModel? weather =
                        await service.getWeather(cityName: cityName!);
                    weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather!;
                    updateUi!();
                    Navigator.pop(context);
                  },
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                border: OutlineInputBorder()),
          ),
        )));
  }
}
