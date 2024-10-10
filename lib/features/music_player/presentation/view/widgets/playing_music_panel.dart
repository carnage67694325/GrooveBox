import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayingMusicPanel extends StatelessWidget {
  final SongModel songModel;
  const PlayingMusicPanel({super.key, required this.songModel});

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
            MusicCard(songModel: songModel),
            const SizedBox(width: 32),
            SizedBox(
              width: 150,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                songModel.title,
                style: AppTextStyles.subHeading
                    .copyWith(color: Colors.black.withOpacity(.7)),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                log('paused music');
                BlocProvider.of<MusicControlCubit>(context)
                    .pauseMusic(songModel);
              },
              icon: const Icon(
                FontAwesomeIcons.pause,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                BlocProvider.of<MusicControlCubit>(context)
                    .forwardMusic(songModel);
              },
              icon: const Icon(
                FontAwesomeIcons.forward,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
