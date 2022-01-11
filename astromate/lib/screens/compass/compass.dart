import 'package:astromate/components.dart';
import 'package:astromate/screens/compass/body.dart';
import 'package:flutter/material.dart';

import 'package:astromate/theme.dart';
import 'package:astromate/components.dart';
import 'package:astromate/screens/compass/body.dart';

class CompassScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        appBar: defultAppBar('Compass and bubble level', context),
        body: CompassBody(),
      ),
    );
  }
  


}