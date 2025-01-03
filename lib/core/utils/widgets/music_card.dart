import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key, required this.songModel});

  final SongModel songModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('music played');
        BlocProvider.of<MusicControlCubit>(context).playMusic(songModel);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                  color: AppColors.musicCardColor,
                  child: QueryArtworkWidget(
                    size: 1000,
                    id: songModel.id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: const Icon(
                      FontAwesomeIcons.music,
                      color: Colors.black,
                      size: 50,
                    ),
                    artworkFit: BoxFit.cover, // Fit the artwork
                    artworkBorder: BorderRadius.circular(0),
                  ))),
        ),
      ),
    );
  }
}
