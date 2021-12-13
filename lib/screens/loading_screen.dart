import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location_service.dart';
import '../services/networking_service.dart';
import './weather_result_screen.dart';
import '../services/weather_service.dart';

const apiKey = '4ceb029340e11d9abb0554e5d07f276a';

class LoadingScreen extends StatefulWidget {
  // Function getCurrentLocation;
  // LoadingScreen(this.getCurrentLocation);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _latitude;
  double _longitude;
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    _getCurrentLocationData();
    super.initState();
  }

  void _getCurrentLocationData() async {
    //fetching the current location
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();
    _latitude = locationService.latitude;
    _longitude = locationService.longitude;
    print(_latitude);
    print(_longitude);

    // sending http request
    NetworkingService networkingService = NetworkingService(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$apiKey&units=metric');
    var result = await networkingService.getWeatherData();
    print(result['name']);
    print(result['main']['temp']);
    var cityName = result['name'];
    var temperature = result['main']['temp'];
    var condition = result['weather'][0]['id'];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherResult(
            cityName: cityName,
            temperature: temperature,
            weatherIcon: weatherService.getWeatherIcon(condition),
            weatherMsg: weatherService.getMessage(temperature),
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
