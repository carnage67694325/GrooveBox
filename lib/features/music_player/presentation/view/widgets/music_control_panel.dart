import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';

class MusicControlPanel extends StatelessWidget {
  const MusicControlPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColors.panelColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.music,
                color: Colors.black,
              ),
              const SizedBox(
                width: 32,
              ),
              Text(
                'Name of the song',
                style: AppTextStyles.subHeading
                    .copyWith(color: Colors.black.withOpacity(.7)),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.play,
                    color: Colors.black,
                  )),
              const SizedBox(
                width: 8,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.forward,
                    color: Colors.black,
                  )),
            ],
          ),
        ));
  }
}
