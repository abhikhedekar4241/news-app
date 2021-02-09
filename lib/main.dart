import 'package:flutter/material.dart';
import 'package:news_app/home.dart';

import 'SizeConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const TIMEOUT = const Duration(seconds: 5);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            // Getting screen size
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'HomeScreen App',
              home: Scaffold(
                // Home widget contains all tabs
                body: Home(),
              ),
            );
          },
        );
      },
    );
  }
}
