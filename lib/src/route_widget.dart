library widget_router;

import 'package:flutter/material.dart' show Widget;
import 'package:widget_router/widget_router.dart';

/// A single navigation Route used
/// in the Widget Router Package.
class RouteWidget {
  const RouteWidget({
    required this.name,
    required this.routeName,
    required this.widget,
  });

  /// The Name of this Widget.
  /// After running the build command,
  /// this will be the name of the constructor
  /// you have to call in the [WidgetRouter] class.
  final String name;

  /// Name of the Route.
  /// This can be specified in the [Routes] class.
  final String routeName;

  /// The Widget or Screen
  /// you want to navigate to.
  final Widget widget;
}
