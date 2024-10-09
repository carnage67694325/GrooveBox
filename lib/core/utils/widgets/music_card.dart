import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          child: AspectRatio(
              aspectRatio: 2.6 / 4,
              child: Container(
                color: AppColors.musicCardColor,
                child: const Icon(
                  FontAwesomeIcons.music,
                  color: Colors.black,
                  size: 50,
                ),
              )),
        ),
      ),
    );
  }
}
