import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_box/core/utils/simple_bloc_observer.dart';
import 'package:groove_box/core/utils/app_router.dart';
import 'package:groove_box/features/home/data/repos/home_repo_imp.dart';
import 'package:groove_box/features/home/presentation/view_model/get_music_cubit/get_music_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const GrooveBoxApp());
}

class GrooveBoxApp extends StatelessWidget {
  const GrooveBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetMusicCubit(HomeRepoImp()),
        )
      ],
      child: MaterialApp.router(
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
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
