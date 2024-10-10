import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/control_button.dart';

class MusicPlayerControls extends StatelessWidget {
  const MusicPlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Slider(
          max: double.infinity,
          value: 0,
          onChanged: (value) => 10,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControlButton(
              onPressed: () {},
              icon: FontAwesomeIcons.backward,
            ),
            const SizedBox(
              width: 20,
            ),
            ControlButton(
              onPressed: () {},
              icon: FontAwesomeIcons.play,
            ),
            const SizedBox(
              width: 20,
            ),
            ControlButton(
              onPressed: () {},
              icon: FontAwesomeIcons.forward,
            ),
          ],
        )
      ],
    );
  }
}
