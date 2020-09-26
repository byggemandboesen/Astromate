import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      title: Text('Astromate'),
      backgroundColor: Theme.of(context).accentColor,
      loaderColor: Theme.of(context).primaryColor,
    );
  }
}