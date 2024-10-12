import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/music_player_controls.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PLayingMusicBody extends StatelessWidget {
  const PLayingMusicBody({
    super.key,
    required this.songModel,
  });
  final SongModel songModel;
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
              height: 100,
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.45,
                child: MusicCard(songModel: songModel)),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 200,
              child: Divider(
                height: 10,
                thickness: 0.8,
                color: Colors.purple.withOpacity(0.2),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              songModel.title,
              style: AppTextStyles.subHeading.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              songModel.artist ?? 'unkown',
              style: AppTextStyles.body
                  .copyWith(color: Colors.black.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 40,
            ),
            MusicPlayerControls(
              isPlaying: true,
              songModel: songModel,
            ),
          ],
        ),
      ),
    );
  }
}
