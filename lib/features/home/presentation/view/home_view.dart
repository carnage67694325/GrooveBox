import 'package:flutter/material.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/music_sliding_up_panel.dart';
import 'package:groove_box/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        HomeViewBody(),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: MusicSlidingUpPanel(),
        ),
      ]),
    );
  }
}
