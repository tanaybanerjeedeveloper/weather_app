import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../services/weather_service.dart';

import './location_search.dart';

class WeatherResult extends StatefulWidget {
  final dynamic weatherData;

  WeatherResult({
    @required this.weatherData,
  });

  @override
  _WeatherResultState createState() => _WeatherResultState();
}

class _WeatherResultState extends State<WeatherResult> {
  WeatherService weatherService = WeatherService();
  String cityName;
  double temperature;
  String weatherMsg;
  String weatherIcon;

  @override
  void initState() {
    super.initState();
    _updateUI(widget.weatherData);
  }

  void _updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        cityName = '';
        temperature = 0.0;
        weatherMsg = 'No Message';
        weatherIcon = '';
        return;
      }
      cityName = weatherData['name'];
      temperature = weatherData['main']['temp'];
      weatherMsg = weatherService.getMessage(temperature);
      weatherIcon =
          weatherService.getWeatherIcon(weatherData['weather'][0]['id']);
    });
  }

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
                  onPressed: () async {
                    var weatherData = await weatherService.getLocationWeather();
                    _updateUI(weatherData);
                  },
                  child: Icon(
                    Icons.near_me,
                    size: 30.0,
                  ),
                ),
                trailing: FlatButton(
                  onPressed: () async {
                    var typedCityName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LocationSearch();
                        },
                      ),
                    );
                    if (typedCityName != null) {
                      var weatherData =
                          await weatherService.getCityWeather(typedCityName);
                      _updateUI(weatherData);
                    }
                  },
                  child: Icon(
                    Icons.location_city,
                    size: 30.0,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${temperature.toStringAsFixed(0)}',
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
              Container(
                // padding: EdgeInsets.only(right: 15.0),

                child: Text(
                  '${weatherMsg} in ${cityName}',
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
