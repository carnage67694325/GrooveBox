import 'dart:developer';
import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:groove_box/features/music_player/data/repo/music_player_repo.dart';
import 'package:path_provider/path_provider.dart';

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
      size: 1000,
      ArtworkType.AUDIO,
    );

    if (artwork != null && artwork.isNotEmpty) {
      // Convert artwork (base64 image) to file
      final directory = await getApplicationDocumentsDirectory();
      final artworkFile = File('${directory.path}/artwork_${songModel.id}.jpg');

      await artworkFile.writeAsBytes(artwork);

      // Set artWorkUri as file URI
      artWorkUri = Uri.file(artworkFile.path);
    } else {
      // Fallback to a default image
      artWorkUri = Uri.parse("https://example.com/default_artwork.jpg");
    }
  }
}
