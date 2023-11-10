library widget_router;

import 'package:flutter/material.dart' show Widget;

/// A single navigation Route used
/// in the Widget Router Package.
class RouteWidget {
  const RouteWidget({
    required this.name,
    required this.routeName,
    required this.doc,
    required this.mobileWidget,
    required this.desktopWidget,
  });

  /// the mobile Version of the Unknown
  /// Widget Screen
  /// This Screen is shown, if you try to navigate to
  /// a Screen that isn't declared in your
  /// Widget Router class.
  static late final Widget? mobileUnknownScreen;

  /// The Desktop Version of the Unknown Widget Screen
  /// This Screen is shown, if you try to navigate to
  /// a Screen that isn't declared in your
  /// Widget Router class.
  static late final Widget? desktopUnknownScreen;

  /// Set Method for both Unknown Widget Screens.
  /// Call this Method first, before you
  /// do anything else with the
  /// Widget Router Package.
  ///
  /// Only call this Method once.
  /// If you call it again, nothing should happen,
  /// but because the Widgets are final, it may cause a runtime
  /// Error.
  static void setUnknownScreens({
    required Widget mobile,
    required Widget desktop,
  }) {
    mobileUnknownScreen ??= mobile;
    desktopUnknownScreen ??= desktop;
  }

  /// The Name of this Widget.
  /// After running the build command,
  /// this will be the name of the constructor.
  final String name;

  /// Name of the Route.
  final String routeName;

  /// The Documentation
  /// you want to write above your
  /// Route Variable.
  /// This is the Documentation associated
  /// with the Routes.$name
  final String doc;

  /// The mobile Version
  /// of a Widget or Screen you
  /// want to navigate to.
  final Widget mobileWidget;

  /// The Desktop Version
  /// of a Widget or Screen you
  /// want to navigate to.
  final Widget desktopWidget;
}