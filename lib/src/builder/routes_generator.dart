library widget_router;

import '../router.dart';
import '../route_widget.dart';
import 'builder.dart';

import 'package:analyzer/dart/element/element.dart' show Element;
import 'package:build/build.dart' show BuildStep;
import 'package:source_gen/source_gen.dart'
    show ConstantReader, GeneratorForAnnotation;

/// Generator for the Annotation [WidgetRouterSet].
/// This Class generates the Routes and WidgetRouter class.
class RoutesGenerator extends GeneratorForAnnotation<WidgetRouterSet> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is Set<RouteWidget>) {
      // Do nothing
    } else {
      throw 'Only a List of RouteWidgets can be annotated with the @WidgetRouterList annotation';
    }

    // Make Element a List of RouteWidgets
    final Set<RouteWidget> set = element as Set<RouteWidget>;
    // Create Builder
    final RoutesBuilder builder = RoutesBuilder(set: set);

    return '''
    ${builder.buildRoutes()}

    ${builder.buildRouter()}
          ''';
  }
}

/// The Builder for this Package
class RoutesBuilder extends Builder {
  // Constant Constructor with Params
  const RoutesBuilder({required this.set});

  /// the List of all Routes.
  /// This List is the List that has
  /// the [WidgetRouterSet] annotation.
  final Set<RouteWidget> set;

  @override
  String buildRouter() {
    // Create Variable and add
    // first Code to it.
    String router = '''
    /// Widget to pass a route Name as String.
    /// Returns the corresponding Widget for either Mobile
    /// or Desktop Devices.
    /// Set the [_isDesktop] Variable with the corresponding setter
    /// isDesktop before you use this Class.
    /// The best way to do something like this is to set the Variable
    /// when starting your App.
    class WidgetRouter extends StatelessWidget {
      const WidgetRouter({required this.routeName Key? key}) : super(key: key);

    ''';

    // add Code for each route to the
    // router Variable
    for (RouteWidget route in set) {
      router += '''
      /// Widget Route for the ${route.name}
      WidgetRouter.${route.name}({Key? key}) : super(key: key) {
        routeName = ${route.routeName};
      }

      ''';
    }

    // add Last Code to Variable
    router += '''

    /// Name of the Route
    late final String routeName;

    /// Whether it's an mobile or desktop OS
    static late final bool? _isDesktop;

    /// Whether it's an mobile or desktop OS.
    /// Use this Setter to set the Variable.
    /// Only set the Variable once, which means
    /// only call this Setter once, because the
    /// Variable is final. Also the operating System
    /// does not change to the runtime of an App.
    /// So call this Method in the start, before doing anything
    /// else.
    static set isDesktop(bool isDesktop) {
      _isDesktop ??= isDesktop;
    }

    /// Whether it's an mobile or desktop OS
    static bool get isDesktop {
      if (_isDesktop == null) {
        throw 'is Desktop is null. Set it before you use it.';
      } else {
        return _isDesktop!;
      }
    }

    @override
    Widget build(BuildContext context) {
        ${_buildSwitch()}
    }
  }
  ''';

    return router;
  }

  String _buildSwitch() {
    String sw = '''
    switch (routeName) {
      ''';

    for (RouteWidget route in set) {
      sw += '''
        case Routes.${route.name}
          return _isDesktop ? ${route.desktopWidget} : ${route.mobileWidget};
            ''';
    }

    sw += '''
      default:
        return _isDesktop ? ${RouteWidget.desktopUnkownScreen} : ${RouteWidget.mobileUnknownScreen};
    }''';

    return sw;
  }

  @override
  String buildRoutes() {
    // Create Variable and add
    // first Code to it.
    String routes = '''
    library widget_router;


    /// Contains nearly all Routes used in this App.
    class Routes {
    ''';

    // add Code for each route to the
    // routes Variable
    for (RouteWidget route in set) {
      routes += '''
      /// ${route.doc}
      static const String ${route.name} = ${route.routeName};
      
      ''';
    }

    // add Last Code to Variable
    routes += '''
    }
    ''';

    return routes;
  }
}
