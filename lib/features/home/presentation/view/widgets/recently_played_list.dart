import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_box/core/utils/widgets/music_card.dart';
import 'package:groove_box/features/home/presentation/view_model/get_music_cubit/get_music_cubit.dart';

class RecentlyPlayedList extends StatelessWidget {
  const RecentlyPlayedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
      ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.2,
        child: BlocBuilder<GetMusicCubit, GetMusicState>(
          builder: (context, state) {
            if (state is GetMusicSuccess) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: MusicCard(
                      onTap: () {
                        log('tapped');
                      },
                      songModel: state.songs[index],
                    ),
                  );
                },
              );
            } else if (state is GetMusicFailure) {
              return Text(state.errMessage);
            } else {
              return const Text('loading');
            }
          },
        ),
      ),
    );
  }
}
