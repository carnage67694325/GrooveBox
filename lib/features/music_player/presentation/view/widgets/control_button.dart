import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_gradient.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.buttonSize,
  });
  final IconData icon;
  final void Function()? onPressed;
  final double? buttonSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.horizontalGradient,
        shape: BoxShape.circle,
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            size: buttonSize ?? 30,
            icon,
            color: Colors.white,
          )),
    );
  }
}
