import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';

class SlidingAnimatedLogo extends StatelessWidget {
  const SlidingAnimatedLogo({
    super.key,
    required this.animationController,
    required this.slidingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    'Groove',
                    style: AppTextStyles.heading.copyWith(fontSize: 55),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Icon(
                  FontAwesomeIcons.music,
                  size: 50,
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          );
        });
  }
}
