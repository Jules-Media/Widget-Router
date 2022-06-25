library widget_router;

import 'package:flutter/material.dart' show Widget;

/// A single navigation Route used
/// in the Widget Router Package.
class RouteWidget {
  const RouteWidget({
    required this.name,
    required this.routeName,
    required this.doc,
    required this.widget,
  });

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

  /// The Widget or Screen
  /// you want to navigate to.
  final Widget mobileWidget;

  final Widget desktopWidget;

  /// The
  final Widget bloc;
}
