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
        appBar: AppBar(
          centerTitle: true,
          title: Text('Astromate', style: Theme.of(context).textTheme.headline1,),
          actions: [
          Consumer<ThemeStatus>(
            builder: (context, themeClass, child){
              return IconButton(
                icon: themeClass.themeBool ? Icon(Icons.brightness_3) : Icon(Icons.brightness_7),
                iconSize: 30,
                onPressed: () async{
                  await themeClass.updateTheme();
                },
              );
            }
          ),
          ],
        ),
        drawer: HomeScreenDrawer(),
        body: HomeBody()
      ),
    );
  }
}