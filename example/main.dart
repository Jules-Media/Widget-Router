library widget_router;

import 'package:flutter/material.dart';
import 'package:widget_router/widget_router.dart';

import 'screens/desktop/unknown_screen_mobile.dart';
import 'screens/mobile/unknown_screen_desktop.dart';
import 'screens/shared/homescreen.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouteWidget.setUnkownScreens(
      mobile: const UnknownScreenMobile(),
      desktop: const UnknownScreenDesktop(),
    );
    return const MaterialApp(
      home: Homescreen(),
    );
  }
}
