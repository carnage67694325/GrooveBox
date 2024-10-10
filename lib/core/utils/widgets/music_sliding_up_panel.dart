import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/widgets/music_control_panel.dart';
import 'package:groove_box/core/utils/widgets/music_panel_body.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MusicSlidingUpPanel extends StatefulWidget {
  const MusicSlidingUpPanel({super.key});

  @override
  State<MusicSlidingUpPanel> createState() => _MusicSlidingUpPanelState();
}

class _MusicSlidingUpPanelState extends State<MusicSlidingUpPanel> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _panelController,
      minHeight: 70.0, // Height of the collapsed panel
      maxHeight: 300.0, // Height of the expanded panel
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
      panel: const MusicPanelBody(),
      collapsed: const MusicControlPanel(),
      body: const SizedBox.shrink(), // No additional body content
    );
  }
}
