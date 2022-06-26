library widget_router;

import 'package:build/build.dart' show Builder, BuilderOptions;
import 'package:source_gen/source_gen.dart' show SharedPartBuilder;
import 'package:widget_router/src/builder/routes_generator.dart'
    show RoutesGenerator;

/// the Builder called for the Widget Router Package
Builder build(BuilderOptions options) {
  return SharedPartBuilder(
    [RoutesGenerator()],
    'widget_router',
    allowSyntaxErrors: false,
  );
}
