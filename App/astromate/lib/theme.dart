import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Colors used in the ThemeData
const red = Color.fromRGBO(175, 0, 0, 1);
const black = Colors.black;
const blue = Color.fromRGBO(0, 115, 240, 1);


// Light and dark theme
class Themes{

  // Light theme
  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      primaryColor: Colors.white,
      accentColor: blue,
      appBarTheme: AppBarTheme(
          color: blue,
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Agency', fontWeight: FontWeight.bold),
          )
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: blue, fontSize: 17, fontFamily: 'Agency'),
          bodyText2: TextStyle(color: blue.withOpacity(0.5), fontSize: 15, fontFamily: 'Agency'),
          subtitle1: TextStyle(color: blue, fontSize: 25, fontFamily: 'Agency'),
          subtitle2: TextStyle(color: blue, fontSize: 17, fontFamily: 'Agency', fontWeight: FontWeight.bold),
          headline1: TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'Agency', fontWeight: FontWeight.bold),
      ),
  );


  // Dark theme
  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.grey[900],
      primaryColor: red,
      accentColor: black,
      appBarTheme: AppBarTheme(
          color: black,
          iconTheme: IconThemeData(
              color: red
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(color: red, fontSize: 30, fontFamily: 'Agency', fontWeight: FontWeight.bold),
          )
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: red, fontSize: 17, fontFamily: 'Agency'),
          bodyText2: TextStyle(color: red.withOpacity(0.5), fontSize: 15, fontFamily: 'Agency'),
          subtitle1: TextStyle(color: red, fontSize: 25, fontFamily: 'Agency'),
          subtitle2: TextStyle(color: red, fontSize: 17, fontFamily: 'Agency', fontWeight: FontWeight.bold),
          headline1: TextStyle(color: red, fontSize: 30, fontFamily: 'Agency', fontWeight: FontWeight.bold),
      ),
  );

}

// Light theme boolean
bool isLightTheme = true;

class ThemeStatus extends ChangeNotifier{
  // Function that updates the light/dark mode boolean with new value
  // Reassigns new bool value in "Shared preferences" to load either light/dark when opening app
  updateTheme() async {
    isLightTheme = !isLightTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLightTheme', isLightTheme);
    notifyListeners();
  }

  // Checks which theme is chosen
  bool get themeBool => isLightTheme;
}
