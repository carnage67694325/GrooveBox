import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'get_music_state.dart';

class GetMusicCubit extends Cubit<GetMusicState> {
  GetMusicCubit() : super(GetMusicInitial());
}
