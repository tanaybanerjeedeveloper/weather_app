import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 70.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 35.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 70.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
