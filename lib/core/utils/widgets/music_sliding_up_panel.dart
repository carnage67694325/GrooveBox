import 'package:flutter/material.dart';
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
      minHeight: 60.0, // Height of the collapsed panel
      maxHeight: 300.0, // Height of the expanded panel
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
      panel: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Expanded Panel Content"),
          ],
        ),
      ),
      collapsed: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.6),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
        ),
        child: Center(
          child: Text(
            "Collapsed Panel (Swipe Up)",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: const SizedBox.shrink(), // No additional body content
    );
  }
}
