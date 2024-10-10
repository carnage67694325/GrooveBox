import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:groove_box/features/music_player/data/repo/music_player_repo.dart';

class MusicPlayerRepoImpl implements MusicPlayerRepo {
  final AudioPlayer audioPlayer = AudioPlayer();
  SongModel? songModel;

  MusicPlayerRepoImpl({this.songModel});

  @override
  void setSong(SongModel song) {
    songModel = song;
  }

  @override
  Future<void> backwarddMusic() async {
    // Start playing the current song
    if (songModel?.uri != null) {
      await audioPlayer.play(UrlSource(songModel!.uri!));
    } else {
      print('Song URI is null');
    }
  }

  @override
  Future<void> forwardMusic() async {
    final currentPosition = await audioPlayer.getCurrentPosition();
    final newPosition = currentPosition! + const Duration(seconds: 10);
    await audioPlayer.seek(newPosition);
  }

  @override
  Future<void> pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Future<void> playMusic() async {
    if (songModel?.uri != null) {
      log('Playing music from: ${songModel!.uri}');
      await audioPlayer.play(UrlSource(songModel!.uri!));
    }
  }
}
