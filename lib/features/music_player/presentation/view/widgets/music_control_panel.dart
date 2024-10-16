import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/paused_music_panel.dart';
import 'package:groove_box/features/music_player/presentation/view/widgets/playing_music_panel.dart';
import 'package:groove_box/features/music_player/presentation/view_model/cubit/music_control_cubit.dart';

class MusicControlPanel extends StatefulWidget {
  const MusicControlPanel({super.key});

  @override
  State<MusicControlPanel> createState() => _MusicControlPanelState();
}

class _MusicControlPanelState extends State<MusicControlPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _waveController;

  // Gradient as per your provided colors
  static const LinearGradient horizontalGradient = LinearGradient(
    colors: [
      Color(0xFF4A148C), // Dark purple
      Color(0xFF0D47A1), // Deep blue
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.3, 1.0], // Adjust stops for desired transition
  );

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 400), // Faster and smoother animation
    );
  }

  @override
  void dispose() {
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicControlCubit, MusicControlState>(
      builder: (context, state) {
        if (state is MusicControlInitial || state is MusicPausedState) {
          _waveController.reverse(); // Trigger wave animation for pause
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250), // Faster transition
            switchInCurve: Curves.easeInOut, // Smoother curve
            child: PausedMusicPanel(
              key: const ValueKey('paused'),
              songModel: (state is MusicPausedState) ? state.song : null,
            ),
          );
        } else if (state is MusicPlayingState) {
          _waveController.forward(); // Trigger wave animation for play
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            switchInCurve: Curves.easeInOut,
            child: PlayingMusicPanel(
              key: const ValueKey('playing'),
              songModel: state.song,
            ),
          );
        } else if (state is MusicLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MusicErrorState) {
          return Center(
            child: Text(
              'Error: ${state.errMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class WaveAnimationWidget extends StatelessWidget {
  final AnimationController controller;

  const WaveAnimationWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: Container(
        height: 80, // Adjust height for wave
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: _MusicControlPanelState
              .horizontalGradient, // Use the gradient here
        ),
        child: CustomPaint(
          painter: WavePainter(controller.value),
        ),
      ),
    );
  }
}

// Custom painter for wave effect with gradient
class WavePainter extends CustomPainter {
  final double waveProgress;

  WavePainter(this.waveProgress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFF4A148C), // Dark purple
          Color(0xFF0D47A1), // Deep blue
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path path = Path();
    const double waveHeight = 10;

    for (double i = 0; i <= size.width; i += 10) {
      path.lineTo(
          i, size.height * 0.5 + (waveHeight * (i % 10) * waveProgress));
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
