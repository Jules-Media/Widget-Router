library widget_router;

/// Annotation for creating the
/// Routes. Annotate your Set with this
/// Annotation.
/// Only use as Annotation.
class WidgetRouterSet {
  /// Annotation for creating the
  /// Routes. Annotate your Set with this
  /// Annotation.
  /// Only use as Annotation.
  ///
  /// Has a constant Constructor 'cause this
  /// is needed for Annotations
  const WidgetRouterSet();

  /// The Description for this Annotation Class.
  static const String description = '''
        This is an Annotation for Dart.
        With this Annotation you can create the classes
        you need for the Widget Router Package.
        You have to create a Set of RouteWidgets
        and give that set the Annotation:
        @WidgetRouterSet()
        ''';
}