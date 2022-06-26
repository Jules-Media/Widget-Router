library widget_router;

import 'package:flutter/material.dart'
    show BuildContext, Center, Key, Scaffold, StatelessWidget, Text, Widget;

/// Simple Homescreen
class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  Center get _body {
    return const Center(
      child: Text('Homescreen'),
    );
  }
}
