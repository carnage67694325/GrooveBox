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
      emit(MusicLoadingState());
      musicPlayerRepo.setSong(song);
      await musicPlayerRepo.playMusic();
      emit(MusicPlayingState(song));
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }

  // Pause music
  Future<void> pauseMusic() async {
    try {
      emit(MusicLoadingState());
      await musicPlayerRepo.pauseMusic();
      emit(MusicPausedState());
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }

  // Forward music by 10 seconds
  Future<void> forwardMusic() async {
    try {
      emit(MusicLoadingState());
      await musicPlayerRepo.forwardMusic();
      emit(MusicForwardedState());
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }

  // Backward music by 10 seconds
  Future<void> backwardMusic() async {
    try {
      emit(MusicLoadingState());
      await musicPlayerRepo.backwardMusic();
      emit(MusicBackwardedState());
    } catch (e) {
      emit(MusicErrorState(e.toString()));
    }
  }
}
