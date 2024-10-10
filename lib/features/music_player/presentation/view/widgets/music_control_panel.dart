import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
        }
        // Handle the playing state by showing the PlayingMusicPanel
        else if (state is MusicPlayingState) {
          return PlayingMusicPanel(songModel: state.song);
        }
        // Handle the loading state by showing a loader (or progress indicator)
        else if (state is MusicLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // Handle error state by showing an error message
        else if (state is MusicErrorState) {
          return Center(
            child: Text(
              'Error: ${state.errMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        // Default case if no other state is matched (in case of new states added later)
        else {
          return const SizedBox(); // Or handle any other future states
        }
      },
    );
  }
}

class PausedMusicPanel extends StatelessWidget {
  final SongModel? songModel; // Added songModel for when paused
  const PausedMusicPanel({
    super.key,
    this.songModel, // Nullable because MusicControlInitial may not have it
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
            if (songModel != null)
              MusicCard(
                  songModel: songModel!), // Display album artwork if available
            const SizedBox(width: 32),
            if (songModel != null)
              Text(
                songModel!.title, // Display song title
                style: AppTextStyles.subHeading
                    .copyWith(color: Colors.black.withOpacity(.7)),
              )
            else
              const Text(
                'No song playing',
                style: AppTextStyles.subHeading,
              ),
            const Spacer(),
            IconButton(
              onPressed: () {
                log('play music');
                BlocProvider.of<MusicControlCubit>(context)
                    .playMusic(songModel!); // Call play
              },
              icon: const Icon(
                FontAwesomeIcons.play,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                // Implement forward functionality
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
            Text(
              songModel.title,
              style: AppTextStyles.subHeading
                  .copyWith(color: Colors.black.withOpacity(.7)),
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
                // Implement forward functionality
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
