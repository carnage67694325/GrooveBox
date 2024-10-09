import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_router.dart';
import 'package:media_store_plus/media_store_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const GrooveBoxApp());
}

class GrooveBoxApp extends StatelessWidget {
  const GrooveBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      routerConfig: AppRouter.router,
    );
  }
}
