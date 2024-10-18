import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_box/core/utils/widgets/music_list_tile.dart';
import 'package:groove_box/features/home/presentation/view_model/get_music_cubit/get_music_cubit.dart';

class MostPlayed extends StatelessWidget {
  const MostPlayed({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMusicCubit, GetMusicState>(
      builder: (context, state) {
        if (state is GetMusicSuccess) {
          return SliverList.builder(
            itemCount: state.songs.length,
            itemBuilder: (context, index) {
              return MusicListTile(songModel: state.songs[index]);
            },
          );
        } else if (state is GetMusicFailure) {
          return SliverToBoxAdapter(
              child: Center(child: Text(state.errMessage)));
        } else {
          return const SliverToBoxAdapter(child: Text('loading'));
        }
      },
    );
  }
}
