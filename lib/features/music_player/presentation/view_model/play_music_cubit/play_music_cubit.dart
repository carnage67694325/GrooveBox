import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'play_music_state.dart';

class PlayMusicCubit extends Cubit<PlayMusicState> {
  PlayMusicCubit() : super(PlayMusicInitial());
}
