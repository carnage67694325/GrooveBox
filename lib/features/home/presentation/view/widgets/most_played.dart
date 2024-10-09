import 'package:flutter/material.dart';
import 'package:groove_box/core/model/music_model.dart';
import 'package:groove_box/core/utils/widgets/music_list_tile.dart';

class MostPlayed extends StatelessWidget {
  const MostPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const MusicListTile(
            musicModel: MusicModel(
                title: 'حمس', artist: "يختاي", album: 'احا', lentgh: ''));
      },
    );
  }
}
