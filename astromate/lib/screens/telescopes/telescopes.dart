import 'package:astromate/screens/telescopes/body.dart';
import 'package:flutter/material.dart';

class TelescopeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Telescopes', style: Theme.of(context).textTheme.headline1,),
        ),
        body: TelescopeBody(),
      ),
    );
  }
}