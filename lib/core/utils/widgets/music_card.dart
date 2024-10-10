import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({super.key, this.onTap, required this.songModel});
  final void Function()? onTap;
  final SongModel songModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                  color: AppColors.musicCardColor,
                  child: QueryArtworkWidget(
                    id: songModel.id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: const Icon(
                      FontAwesomeIcons.music,
                      color: Colors.black,
                      size: 50,
                    ), // Default icon if no artwork
                    artworkFit: BoxFit.cover, // Fit the artwork
                    artworkBorder: BorderRadius.circular(
                        0), // Optional: Make artwork circular
                  ))),
        ),
      ),
    );
  }
}
