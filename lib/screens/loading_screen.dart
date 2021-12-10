import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location_service.dart';
import '../services/networking_service.dart';

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
        'https://api.openweathermap.org/data/2.5/weather?lat=${_latitude}&lon=${_longitude}&appid=$apiKey');
    networkingService.getWeatherData();
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
