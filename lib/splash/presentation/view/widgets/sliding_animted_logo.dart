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
            child: Stack(
              children: [
                // Center the icon behind the text
                Center(
                  child: Icon(
                    FontAwesomeIcons.music,
                    size: 250,
                    color: Colors.white.withOpacity(
                        0.5), // Optional: make the icon slightly transparent
                  ),
                ),
                Center(
                  child: Text(
                    'Groove',
                    style: AppTextStyles.qwitcher
                        .copyWith(fontSize: 105, fontWeight: FontWeight.w900),
                  ),
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
