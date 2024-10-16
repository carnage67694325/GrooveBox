import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_gradient.dart';

class ControlButton extends StatelessWidget {
  const ControlButton(
      {super.key,
      this.onPressed,
      required this.icon,
      this.buttonSize,
      this.isPressed = false});
  final IconData icon;
  final void Function()? onPressed;
  final double? buttonSize;
  final bool? isPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.horizontalGradient,
        shape: isPressed! ? BoxShape.rectangle : BoxShape.circle,
        borderRadius:
            isPressed! ? BorderRadius.all(Radius.elliptical(16, 18)) : null,
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
