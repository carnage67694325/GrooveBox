import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_music_state.dart';

class GetMusicCubit extends Cubit<GetMusicState> {
  GetMusicCubit() : super(GetMusicInitial());
}
