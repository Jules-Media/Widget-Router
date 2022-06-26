library widget_router;

import 'package:widget_router/widget_router.dart';

/// Own Implementation of the Builder.
abstract class Builder {
  // Constant Constructor.
  const Builder({required this.list});

  /// List of RouteWidgets, the Router should generate something
  /// for.
  final List<RouteWidget> list;

  /// Method that build the Widget Router
  /// and returns the File as a String
  String buildRouter();

  /// Method that vuilds the Routes Class
  /// and returns it as a String.
  String buildRoutes();
}
