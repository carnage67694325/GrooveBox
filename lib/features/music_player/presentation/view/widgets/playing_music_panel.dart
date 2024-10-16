import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/control_button.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayingMusicPanel extends StatefulWidget {
  final SongModel songModel;
  const PlayingMusicPanel({super.key, required this.songModel});

  @override
  State<PlayingMusicPanel> createState() => _PlayingMusicPanelState();
}

class _PlayingMusicPanelState extends State<PlayingMusicPanel> {
  late bool? isPressed = false;

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
            MusicCard(songModel: widget.songModel),
            const SizedBox(width: 32),
            SizedBox(
              width: 150,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.songModel.title,
                style: AppTextStyles.subHeading
                    .copyWith(color: Colors.black.withOpacity(.7)),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 40,
              child: ControlButton(
                  isPressed: true,
                  onPressed: () {
                    log('paused music');

                    BlocProvider.of<MusicControlCubit>(context)
                        .pauseMusic(widget.songModel);
                  },
                  buttonSize: 20,
                  icon: FontAwesomeIcons.pause),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 40,
              child: ControlButton(
                onPressed: () {
                  BlocProvider.of<MusicControlCubit>(context)
                      .forwardMusic(widget.songModel);
                },
                buttonSize: 20,
                icon: FontAwesomeIcons.forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
