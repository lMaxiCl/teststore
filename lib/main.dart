import 'package:flutter/material.dart';
import 'package:teststore/tools/routes.dart';
import 'package:teststore/ui/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'eCommerce',
      theme: ThemeManager.theme,
      routerConfig: router,
    );
  }
}
