import 'package:on_audio_query/on_audio_query.dart';

abstract class HomeRepo {
  Future<List<SongModel>> getAllMusic();
}
