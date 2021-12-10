import 'package:flutter/material.dart';
import '../services/location_service.dart';

class LoadingScreen extends StatefulWidget {
  // Function getCurrentLocation;
  // LoadingScreen(this.getCurrentLocation);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationService locationHelper = LocationService();

  @override
  void initState() {
    locationHelper.getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('here should be the soinner'),
    );
  }
}
