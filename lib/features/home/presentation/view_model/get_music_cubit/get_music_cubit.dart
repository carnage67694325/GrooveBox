import 'package:bloc/bloc.dart';
import 'package:groove_box/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'get_music_state.dart';

class GetMusicCubit extends Cubit<GetMusicState> {
  GetMusicCubit(this.homeRepo) : super(GetMusicInitial());
  final HomeRepo homeRepo;
  Future<void> getAllMusic() async {
    try {
      emit(GetMusicLoading());
      final dynamic songs = await homeRepo.getAllMusic();
      emit(GetMusicSuccess(songs: songs));
    } on Exception catch (e) {
      emit(GetMusicFailure(errMessage: e.toString()));
    }
  }
}
