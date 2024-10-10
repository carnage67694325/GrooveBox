import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:groove_box/core/utils/app_gradient.dart';
import 'package:groove_box/core/utils/app_router.dart';
import 'package:groove_box/core/utils/permission_handler.dart';
import 'package:groove_box/core/utils/widgets/custom_gradient_container.dart';
import 'package:groove_box/features/home/presentation/view_model/get_music_cubit/get_music_cubit.dart';
import 'package:groove_box/splash/presentation/view/widgets/sliding_animted_logo.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initiSlidingAnimation();
    transitionToHomeView();
    PermissionHandler.requestPermissions();
    BlocProvider.of<GetMusicCubit>(context).getAllMusic();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppGradients.buildHorizontalGradeint(),
        child: SlidingAnimatedLogo(
            animationController: animationController,
            slidingAnimation: slidingAnimation),
      ),
    );
  }

  void initiSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, .25), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void transitionToHomeView() {
    Future.delayed(const Duration(milliseconds: 1200), () {
      GoRouter.of(context).push(AppRouter.homePath);
    });
  }
}
