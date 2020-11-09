import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:astromate/theme.dart';
import 'package:astromate/splashscreen.dart';

// Screens:
import 'package:astromate/screens/homescreen/homescreen.dart';
import 'package:astromate/screens/telescopes/telescopes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isLightTheme = prefs.getBool('isLightTheme') ?? true;
  prefs.setBool('isLightTheme', isLightTheme);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeStatus(),
        child: Consumer<ThemeStatus>(
          builder: (context, themeClass, child)=> MaterialApp(
            theme: themeClass.themeBool ? Themes().lightTheme : Themes().darkTheme,
            routes: {
              '/homescreen': (context) => HomeScreen(),
              '/telescopes': (context) => TelescopeScreen()
            },
            home: Splash(),
          )
        ),
      );
  }
}
