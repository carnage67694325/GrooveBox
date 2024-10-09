import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/core/model/music_model.dart';
import 'package:groove_box/core/utils/app_gradient.dart';
import 'package:groove_box/core/utils/app_text_styles.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicListTile extends StatefulWidget {
  const MusicListTile({
    super.key,
    required this.songModel,
  });
  final SongModel songModel;

  @override
  State<MusicListTile> createState() => _MusicListTileState();
}

class _MusicListTileState extends State<MusicListTile> {
  bool isAddedToFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: AppGradients.diagonalGradient,
            borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .13,
                    child: MusicCard(
                      onTap: () {},
                      songModel: widget.songModel,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            widget.songModel.title,
                            style: AppTextStyles.subHeading,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            widget.songModel.artist ?? 'artist',
                            style: AppTextStyles.body,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        if (!isAddedToFavourite) {
                          setState(() {
                            isAddedToFavourite = true;
                          });
                        } else {
                          setState(() {
                            isAddedToFavourite = false;
                          });
                        }
                      },
                      icon: isAddedToFavourite
                          ? const Icon(
                              FontAwesomeIcons.solidHeart,
                            )
                          : const Icon(FontAwesomeIcons.heart)),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
