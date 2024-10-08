import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_gradient.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(gradient: AppGradients.horizontalGradient),
    );
  }
}
