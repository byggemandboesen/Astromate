import 'package:astromate/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:astromate/theme.dart';
import 'package:astromate/screens/homescreen/components.dart';
import 'package:astromate/screens/homescreen/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defultAppBar('Astromate', context),
        drawer: HomeScreenDrawer(),
        body: HomeBody()
      ),
    );
  }
}