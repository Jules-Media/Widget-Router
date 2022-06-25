library widget_router;

/// Annotation for creating the
/// Routes. Annotate you List with this
/// Annotation.
/// Only use as Annotation.
class WidgetRouterList {
  /// Constant Constructor is needed for Annotations.
  const WidgetRouterList();

  /// The Description for this Annotation Class.
  static const String description = '''
        This is an Annotiation for Dart.
        With this Annotation you can create the classes
        you need for the Widget Router Package.
        You have to create a List of RouteWidgets
        and give that list the Annotation:
        @WidgetRouterList()
        ''';
}
