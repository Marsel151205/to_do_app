import 'package:flutter/material.dart';
import 'package:to_do_app/app/app_router.dart';

import '../core/themes/colors.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary))
    );
  }
}
