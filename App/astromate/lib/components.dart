import 'package:flutter/material.dart';
import 'package:astromate/theme.dart';
import 'package:provider/provider.dart';

AppBar defultAppBar(String title, BuildContext context){
  return AppBar(
    title: Text(title, style: Theme.of(context).textTheme.headline1),
    centerTitle: true,
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
  );

}