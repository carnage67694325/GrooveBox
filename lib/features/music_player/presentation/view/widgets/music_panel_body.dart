import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/music_player_controls.dart';

class MusicPanelBody extends StatelessWidget {
  const MusicPanelBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.panelColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18.0))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            const Divider(
              height: 40,
              color: Colors.black,
            ),
            const Icon(
              FontAwesomeIcons.music,
              color: Colors.black,
              size: 50,
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              height: 40,
              color: Colors.black,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Name of song',
              style: AppTextStyles.subHeading.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Artist',
              style: AppTextStyles.body
                  .copyWith(color: Colors.black.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 40,
            ),
            const MusicPlayerControls(),
          ],
        ),
      ),
    );
  }
}
