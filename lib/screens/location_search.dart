import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                    )),
              ),
              Container(
                margin: EdgeInsets.all(30.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Container(
                // width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  onPressed: () {
                    // print(cityName);
                    Navigator.pop(context, cityName);
                  },
                  // color: Colors.blue[900],
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
