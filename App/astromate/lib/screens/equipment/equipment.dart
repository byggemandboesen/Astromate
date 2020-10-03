import 'package:astromate/screens/equipment/body.dart';
import 'package:flutter/material.dart';

class EquipmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Equipment', style: Theme.of(context).textTheme.headline1,),
        ),
        body: EquipmentBody(),
      ),
    );
  }
}