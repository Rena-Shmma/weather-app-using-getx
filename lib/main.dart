import 'package:flutter/material.dart';
import 'package:my_news_api/models/weather_model.dart';
import 'package:my_news_api/pages/home_page.dart';
import 'package:my_news_api/providers/weather_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create : (context){
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
   WeatherApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
     MaterialApp(
       theme: ThemeData(
         primarySwatch: Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()
       ),
        home: HomePage(),

    );
  }
}

