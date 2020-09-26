import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:astromate/theme.dart';
import 'package:astromate/splashscreen.dart';

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
        create: (context) => themeStatus(),
        child: Consumer<themeStatus>(
          builder: (context, themeStatus, child)=> MaterialApp(
            theme: themeStatus.themeBool ? Themes().lightTheme : Themes().darkTheme,
            routes: {
            },
            home: Splash(),
          )
        ),
      );
  }
}
