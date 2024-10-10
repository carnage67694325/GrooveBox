import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/paused_music_panel.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/playing_music_panel.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';

class MusicControlPanel extends StatelessWidget {
  const MusicControlPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicControlCubit, MusicControlState>(
      builder: (context, state) {
        if (state is MusicControlInitial || state is MusicPausedState) {
          return PausedMusicPanel(
            songModel: (state is MusicPausedState) ? state.song : null,
          );
        } else if (state is MusicPlayingState) {
          return PlayingMusicPanel(songModel: state.song);
        } else if (state is MusicLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MusicErrorState) {
          return Center(
            child: Text(
              'Error: ${state.errMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
