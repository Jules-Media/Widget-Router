library widget_router;

/// Own Implementation of the Builder.
abstract class Builder {
  // Constant Constructor.
  const Builder();

  /// Method that build the Widget Router
  /// and returns the File as a String
  String buildRouter();

  /// Method that vuilds the Routes Class
  /// and returns it as a String.
  String buildRoutes();
}
