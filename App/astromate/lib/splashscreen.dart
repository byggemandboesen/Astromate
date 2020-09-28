import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      title: Text('Astromate', style: Theme.of(context).textTheme.headline1,),
      backgroundColor: Theme.of(context).primaryColor,
      loaderColor: Theme.of(context).accentColor,
      navigateAfterSeconds: '/homescreen',
      // TODO: Create app logo
    );
  }
}