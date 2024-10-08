import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_router.dart';

void main() {
  runApp(const GrooveBoxApp());
}

class GrooveBoxApp extends StatelessWidget {
  const GrooveBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
