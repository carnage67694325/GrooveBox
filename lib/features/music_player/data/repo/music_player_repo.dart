import 'package:on_audio_query/on_audio_query.dart';

abstract class MusicPlayerRepo {
  Future<void> playMusic();
  Future<void> pauseMusic();
  Future<void> forwardMusic();
  Future<void> backwardMusic();
  void setSong(SongModel song);
}
