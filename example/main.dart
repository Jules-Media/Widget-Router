library widget_router;

import 'package:flutter/material.dart';
import 'package:widget_router/widget_router.dart';

import 'screens/desktop/unknown_screen_mobile.dart';
import 'screens/mobile/unknown_screen_desktop.dart';
import 'screens/shared/homescreen.dart';

void main() {
  runApp(const ExampleApp());
}

/// Example App for Widget Router Package
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @WidgetRouterSet()
  static const Set<RouteWidget> routes = {
    RouteWidget(
      name: 'Homescreen',
      routeName: '/home',
      doc: 'The Homescreen of this App',
      desktopWidget: Homescreen(),
      mobileWidget: Homescreen(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    RouteWidget.setUnknownScreens(
      mobile: const UnknownScreenMobile(),
      desktop: const UnknownScreenDesktop(),
    );
    return const MaterialApp(
      home: Homescreen(),
    );
  }
}