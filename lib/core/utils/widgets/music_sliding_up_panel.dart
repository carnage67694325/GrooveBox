import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_color.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/music_control_panel.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/music_panel_body.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MusicSlidingUpPanel extends StatefulWidget {
  const MusicSlidingUpPanel({super.key});

  @override
  State<MusicSlidingUpPanel> createState() => _MusicSlidingUpPanelState();
}

class _MusicSlidingUpPanelState extends State<MusicSlidingUpPanel> {
  final PanelController _panelController = PanelController();
  double _borderRadius = 18.0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SlidingUpPanel(
      color: AppColors.panelColor,
      controller: _panelController,
      minHeight: 70.0, // Height of the collapsed panel
      maxHeight: screenHeight, // Full screen height when expanded
      borderRadius: BorderRadius.vertical(top: Radius.circular(_borderRadius)),
      onPanelSlide: (position) {
        setState(() {
          _borderRadius = (1 - position) * 18.0;
        });
      },
      panel: const MusicPanelBody(),
      collapsed: const MusicControlPanel(),
      body: const SizedBox.shrink(),
    );
  }
}
