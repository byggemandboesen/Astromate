import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const red = Color.fromRGBO(175, 0, 0, 1);
const grey = Color.fromRGBO(100, 100, 100, 1);
const blue = Color.fromRGBO(0, 115, 240, 1);


// TODO: Probably fix the text themes
class Themes{

  // Light theme
  ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      primaryColor: blue,
      accentColor: grey,
      appBarTheme: AppBarTheme(
          color: grey,
          iconTheme: IconThemeData(
              color: blue
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(color: blue, fontSize: 30, fontFamily: 'Black'),
          )
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: blue, fontSize: 17, fontFamily: 'Light'),
          bodyText2: TextStyle(color: blue.withOpacity(0.5), fontSize: 15, fontFamily: 'Light'),
          headline1: TextStyle(color: blue, fontSize: 30, fontFamily: 'Black'),
          subtitle1: TextStyle(color: blue, fontSize: 25, fontFamily: 'Light'),
          subtitle2: TextStyle(color: blue, fontSize: 17, fontFamily: 'Light', fontWeight: FontWeight.bold)
      ),
  );


  // Dark theme
  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.grey[900],
      primaryColor: red,
      accentColor: grey,
      appBarTheme: AppBarTheme(
          color: grey,
          iconTheme: IconThemeData(
              color: red
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            headline1: TextStyle(color: red, fontSize: 30, fontFamily: 'Black'),
          )
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color: red, fontSize: 17, fontFamily: 'Light'),
          bodyText2: TextStyle(color: red.withOpacity(0.5), fontSize: 15, fontFamily: 'Light'),
          headline1: TextStyle(color: red, fontSize: 30, fontFamily: 'Black'),
          subtitle1: TextStyle(color: red, fontSize: 25, fontFamily: 'Light'),
          subtitle2: TextStyle(color: red, fontSize: 17, fontFamily: 'Light', fontWeight: FontWeight.bold)
      ),
  );

}

bool isLightTheme = true;

class themeStatus extends ChangeNotifier{
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
