library widget_router;

import '../router.dart';
import '../route_widget.dart';
import 'builder.dart';

import 'package:analyzer/dart/element/element.dart' show Element;
import 'package:build/build.dart' show BuildStep;
import 'package:source_gen/source_gen.dart'
    show ConstantReader, GeneratorForAnnotation;

/// Generator for the Annotation [WidgetRouterList].
/// This Class generates the Routes and WidgetRouter class.
class RoutesGenerator extends GeneratorForAnnotation<WidgetRouterList> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is List<RouteWidget>) {
      // Do nothing
    } else {
      throw 'Only a List of RouteWidgets can be annotated with the @WidgetRouterList annotation';
    }

    // Make Element a List of RouteWidgets
    final List<RouteWidget> list = element as List<RouteWidget>;
    // Create Builder
    final RoutesBuilder builder = RoutesBuilder(list: list);

    return '''
    ${builder.buildRoutes()}

    ${builder.buildRouter()}
          ''';
  }
}

/// The Builder for this Package
class RoutesBuilder extends Builder {
  // Constant Constructor with Params
  const RoutesBuilder({required this.list}) : super(list: list);

  /// the List of all Routes.
  /// This List is the List that has
  /// the [WidgetRouterList] annotation.
  final List<RouteWidget> list;

  @override
  String buildRouter() {
    // Create Variable and add
    // first Code to it.
    String router = '''
    /// Widget to pass a route Name as String.
    /// Returns the corresponding Widget for either Mobile
    /// or Desktop Devices.
    class WidgetRouter extends StatelessWidget {
      const WidgetRouter({required this.routeName Key? key}) : super(key: key);

    ''';

    // add Code for each route to the
    // router Variable
    for (RouteWidget route in list) {
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

    /// Whether it's an mobile or desktop OS
    static set isDesktop(bool isDesktop) {
      _isDesktop ??= isDesktop;
    }

    /// Whether it's an mobile or desktop OS
    static bool get isDesktop {
      if (_isDesktop == null) {
        throw ErrorDescription('is Desktop is null. Set it before you use it.');
      } else {
        return _isDesktop!;
      }
    }

    @override
    Widget build(BuildContext context) {
      switch (routeName) {
        
        default:
          return const UnknownScreen();
      }
    }
  }
  ''';

    return router;
  }

  @override
  String buildRoutes() {
    // Create Variable and add
    // first Code to it.
    String routes = '''
    /// Contains nearly all Routes used in this App.
    class Routes {
    ''';

    // add Code for each route to the
    // routes Variable
    for (RouteWidget route in list) {
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
