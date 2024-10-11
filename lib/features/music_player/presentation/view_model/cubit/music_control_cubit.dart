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
      emit(MusicErrorState(e.toString()));
    }
  }

  Future<void> resumeMusic(SongModel song) async {
    try {
      emit(MusicPlayingState(song));
      await musicPlayerRepo.resumeMusic();
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }

  // Pause music
  Future<void> pauseMusic(SongModel song) async {
    try {
      await musicPlayerRepo.pauseMusic();
      emit(MusicPausedState(song: song));
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }

  // Forward music by 10 seconds
  Future<void> forwardMusic(SongModel song) async {
    try {
      await musicPlayerRepo.forwardMusic();
      emit(MusicPlayingState(song));
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }

  // Backward music by 10 seconds
  Future<void> backwardMusic(SongModel song) async {
    try {
      await musicPlayerRepo.backwardMusic();
      emit(MusicPlayingState(song));
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }
}
