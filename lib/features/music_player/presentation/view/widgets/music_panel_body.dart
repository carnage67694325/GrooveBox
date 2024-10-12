import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/paused_music_body.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/playing_music_body.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';

class MusicPanelBody extends StatelessWidget {
  const MusicPanelBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicControlCubit, MusicControlState>(
      builder: (context, state) {
        if (state is MusicPlayingState) {
          return PLayingMusicBody(
            songModel: state.song,
          );
        } else if (state is MusicPausedState) {
          return PausedMusicBody(songModel: state.song);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
