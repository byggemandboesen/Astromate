import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:aeyrium_sensor/aeyrium_sensor.dart';
import 'dart:math' as math;

import 'package:astromate/theme.dart';

class CompassBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor
            ),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Label('Altitude:'),
              Altitude()
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor
            ),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Label('Azimuth:'),
              Azimuth()
            ],
          ),
        ),
      ],
    );
  }
}

// Gets the current altitude value
class Altitude extends StatefulWidget {
  @override
  _AltitudeState createState() => _AltitudeState();
}

class _AltitudeState extends State<Altitude> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AeyriumSensor.sensorEvents,
      builder: (context, snapshot){
        return snapshot.hasData ?
        ValueField((snapshot.data.pitch * (180/math.pi)+90).toStringAsFixed(2))
        : ValueField('Waiting for compass');
      },
    );
  }
}


// Gets the current azimuth value from compass
class Azimuth extends StatefulWidget {
  @override
  _AzimuthState createState() => _AzimuthState();
}

class _AzimuthState extends State<Azimuth> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterCompass.events,
      builder: (context, snapshot){
        return snapshot.hasData ?
        ValueField(snapshot.data.heading.toStringAsFixed(2))
        : ValueField('Waiting for compass');
      },
    );
  }
}


// Label for alt/az
class Label extends StatelessWidget {

  final String labelText;
  Label(this.labelText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(labelText, style: Theme.of(context).textTheme.subtitle1),
    );
  }
}

// Value field for alt/az values
class ValueField extends StatelessWidget {

  final String labelText;
  ValueField(this.labelText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(labelText, style: Theme.of(context).textTheme.subtitle2),
    );
  }
}

