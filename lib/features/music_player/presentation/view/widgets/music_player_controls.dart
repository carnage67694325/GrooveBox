import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/control_button.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicPlayerControls extends StatelessWidget {
  const MusicPlayerControls({
    super.key,
    this.isPlaying = false,
    this.audioModel,
  });
  final bool isPlaying;

  final AudioModel? audioModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Slider(
          max: double.infinity,
          value: 0,
          onChanged: (value) => 10,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControlButton(
              onPressed: () {
                !isPlaying
                    ? BlocProvider.of<MusicControlCubit>(context)
                        .playMusic(audioModel!)
                    : BlocProvider.of<MusicControlCubit>(context)
                        .backwardMusic(audioModel!);
              },
              icon: FontAwesomeIcons.backward,
            ),
            const SizedBox(
              width: 40,
            ),
            ControlButton(
              isPressed: isPlaying,
              onPressed: () {
                if (!isPlaying) {
                  BlocProvider.of<MusicControlCubit>(context)
                      .resumeMusic(audioModel!);
                } else {
                  BlocProvider.of<MusicControlCubit>(context)
                      .pauseMusic(audioModel!);
                }
              },
              icon: !isPlaying ? FontAwesomeIcons.play : FontAwesomeIcons.pause,
            ),
            const SizedBox(
              width: 40,
            ),
            ControlButton(
              onPressed: () {
                !isPlaying
                    ? BlocProvider.of<MusicControlCubit>(context)
                        .playMusic(audioModel!)
                    : BlocProvider.of<MusicControlCubit>(context)
                        .forwardMusic(audioModel!);
              },
              icon: FontAwesomeIcons.forward,
            ),
          ],
        )
      ],
    );
  }
}
