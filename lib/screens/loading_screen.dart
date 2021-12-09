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
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('get location'),
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: locationHelper.getCurrentLocation,
      ),
    );
  }
}
