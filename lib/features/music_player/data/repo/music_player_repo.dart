abstract class MusicPlayerRepo {
  Future<void> playMusic();
  Future<void> pauseMusic();
  Future<void> forwardMusic();
  Future<void> backwarddMusic();
}
