import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';

class MusicSlidingUpPanel extends StatefulWidget {
  const MusicSlidingUpPanel({super.key});

  @override
  State<MusicSlidingUpPanel> createState() => _MusicSlidingUpPanelState();
}

class _MusicSlidingUpPanelState extends State<MusicSlidingUpPanel> {
  late SlidingUpPanelController slidingUpPanelController;
  @override
  void initState() {
    slidingUpPanelController = SlidingUpPanelController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanelWidget(
      controlHeight: 300,
      panelController: slidingUpPanelController,
      child: const Text('panel'),
    );
  }
}
