import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'provider/theme_changer.dart';
import 'style/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(true),
          lazy: false,
        ),
      ],
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    final initTheme = !_theme.isLight ? darkTheme : lightTheme;

    return ThemeProvider(
      initTheme: initTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Jeeali',
            home: HomePage(),
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
          );
        },
      ),
    );
  }
}
