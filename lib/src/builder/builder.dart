library widget_router;

import 'package:build/build.dart' as official_builder show Builder;

/// Own Implementation of the Builder.
abstract class Builder implements official_builder.Builder {
  // Constant Constructor.
  const Builder();

  /// Method that build the Widget Router
  /// and returns the File as a String
  String buildRouter();

  /// Method that builds the Routes Class
  /// and returns it as a String.
  String buildRoutes();
}