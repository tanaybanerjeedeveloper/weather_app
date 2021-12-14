import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './weather_result_screen.dart';
import '../services/weather_service.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    _getCurrentLocationData();
    super.initState();
  }

  void _getCurrentLocationData() async {
    //getting the data from the weatherservice
    var result = await weatherService.getLocationWeather();
    // var cityName = result['name'];
    // var temperature = result['main']['temp'];
    // var condition = result['weather'][0]['id'];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherResult(
            // cityName: cityName,
            // temperature: temperature,
            // weatherIcon: weatherService.getWeatherIcon(condition),
            // weatherMsg: weatherService.getMessage(temperature),
            weatherData: result,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
