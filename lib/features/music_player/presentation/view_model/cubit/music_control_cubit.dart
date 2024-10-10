import 'package:bloc/bloc.dart';
import 'package:groove_box/features/music_player/data/repo/music_player_repo.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'music_control_state.dart';

class MusicControlCubit extends Cubit<MusicControlState> {
  final MusicPlayerRepo musicPlayerRepo;

  MusicControlCubit(this.musicPlayerRepo) : super(MusicControlInitial());

  // Play music
  Future<void> playMusic(SongModel song) async {
    try {
      emit(MusicPlayingState(song));
      musicPlayerRepo.setSong(song);
      await musicPlayerRepo.playMusic();
      // Emit the playing state
    } catch (e) {
      emit(MusicErrorState(
          e.toString())); // Emit an error state in case of failure
    }
  }

  // Pause music
  Future<void> pauseMusic(SongModel song) async {
    try {
      await musicPlayerRepo.pauseMusic();
      emit(MusicPausedState(song: song)); // Emit paused state
    } catch (e) {
      emit(MusicErrorState(e.toString())); // Emit error state
    }
  }

  // Forward music by 10 seconds
  Future<void> forwardMusic(SongModel song) async {
    try {
      await musicPlayerRepo.forwardMusic();
      emit(MusicPlayingState(
          song)); // Emit playing state after forward to reflect changes
    } catch (e) {
      emit(
          MusicErrorState(e.toString())); // Emit error state in case of failure
    }
  }

  // Backward music by 10 seconds
  Future<void> backwardMusic(SongModel song) async {
    try {
      await musicPlayerRepo.backwardMusic();
      emit(MusicPlayingState(
          song)); // Emit playing state after backward to reflect changes
    } catch (e) {
      emit(
          MusicErrorState(e.toString())); // Emit error state in case of failure
    }
  }
}
