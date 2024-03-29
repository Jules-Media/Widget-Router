library widget_router;

import 'package:flutter/material.dart'
    show BuildContext, Center, Scaffold, StatelessWidget, Text, Widget;

/// Simple Desktop Screen for
/// unknown Screens.
class UnknownScreenDesktop extends StatelessWidget {
  const UnknownScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  /// Body of the Screen
  Center get _body {
    return const Center(
      child: Text('Could not find the Screen you were searching for'),
    );
  }
}