import 'package:flutter/material.dart';

class WeatherResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage('assets/images/weather_background.jfif'),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: ListTile(
      //     leading: FlatButton(
      //       onPressed: () {},
      //       child: Icon(Icons.near_me),
      //     ),
      //   ),
      // ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/weather_background.jfif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
