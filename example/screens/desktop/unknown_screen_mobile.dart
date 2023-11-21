library widget_router;

import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;

/// Simple Mobile Screen for
/// unknown Sites
class UnknownScreenMobile extends StatelessWidget {
  const UnknownScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar {
    return AppBar(title: const Text('Error'));
  }

  Center get _body {
    return const Center(
      child: Text('Could not find the Screen you were searching for'),
    );
  }
}