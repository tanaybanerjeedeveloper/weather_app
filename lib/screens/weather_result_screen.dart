import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../services/weather_service.dart';

class WeatherResult extends StatelessWidget {
  WeatherService weatherService = WeatherService();
  final String cityName;
  final double temperature;
  final String weatherIcon;
  final String weatherMsg;
  WeatherResult({
    @required this.cityName,
    @required this.temperature,
    @required this.weatherIcon,
    @required this.weatherMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/weather_background.jfif'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                leading: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.near_me,
                    size: 30.0,
                  ),
                ),
                trailing: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.location_city,
                    size: 30.0,
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 15.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         '$temperature',
              //         style: kTempTextStyle,
              //       ),
              //       Text(
              //         weatherIcon,
              //         style: kConditionTextStyle,
              //       ),
              //     ],
              //   ),
              // ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$temperature',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 15.0),
              //   child: Text(
              //     '$weatherMsg in $cityName',
              //     textAlign: TextAlign.right,
              //     style: kMessageTextStyle,
              //   ),
              // )
              Container(
                // padding: EdgeInsets.only(right: 15.0),

                child: Text(
                  '$weatherMsg in $cityName',
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
