import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:groove_box/features/music_player/data/repo/music_player_repo.dart';

class MusicPlayerRepoImpl implements MusicPlayerRepo {
  final AudioPlayer audioPlayer = AudioPlayer();
  SongModel? songModel;

  @override
  void setSong(SongModel song) {
    songModel = song;
  }

  @override
  Future<void> playMusic() async {
    if (songModel?.uri != null) {
      try {
        await audioPlayer
            .setAudioSource(AudioSource.uri(Uri.parse(songModel!.uri!)));
        await audioPlayer.play();
      } catch (e) {
        print('Error playing music: $e');
      }
    } else {
      print('Song URI is null');
    }
  }

  @override
  Future<void> pauseMusic() async {
    if (audioPlayer.playing) {
      await audioPlayer.pause();
    } else {
      log('Music is not playing');
    }
  }

  @override
  Future<void> forwardMusic() async {
    final currentPosition = await audioPlayer.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    await audioPlayer.seek(newPosition);
  }

  @override
  Future<void> backwardMusic() async {
    final currentPosition = await audioPlayer.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      await audioPlayer.seek(newPosition);
    } else {
      await audioPlayer.seek(Duration.zero);
    }
  }
}
