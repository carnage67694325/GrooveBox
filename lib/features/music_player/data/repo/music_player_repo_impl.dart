import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:groove_box/features/music_player/data/repo/music_player_repo.dart';

class MusicPlayerRepoImpl implements MusicPlayerRepo {
  final AudioPlayer audioPlayer = AudioPlayer();
  final OnAudioQuery audioQuery = OnAudioQuery();
  SongModel? songModel;
  Uri? artWorkUri;
  @override
  void setSong(SongModel song) {
    songModel = song;
  }

  @override
  Future<void> playMusic() async {
    if (songModel?.uri != null) {
      try {
        await audioPlayer.setAudioSource(
          AudioSource.uri(
            Uri.parse(songModel!.uri!),
            tag: MediaItem(
                id: '${songModel!.id}',
                artist: "${songModel!.artist}",
                title: "${songModel!.title}",
                artUri: artWorkUri),
          ),
        );
        await audioPlayer.play();
      } catch (e) {
        print('Error playing music: $e');
      }
    } else {
      print('Song URI is null');
    }
  }

  @override
  Future<void> resumeMusic() async {
    if (!audioPlayer.playing) {
      await audioPlayer.play(); // Resumes from the current paused position
    } else {
      log('Music is already playing');
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

  @override
  Future<void> playSongWithArtwork(SongModel songModel) async {
    final artwork = await audioQuery.queryArtwork(
      songModel.id,
      ArtworkType.AUDIO,
    );

    if (artwork != null) {
      log('artwork loaded');
      artWorkUri = Uri.dataFromBytes(artwork,
          mimeType: 'image/jpeg'); // Parse artwork to Uri
    }
  }
}
