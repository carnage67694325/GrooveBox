import 'package:groove_box/features/home/data/home_repo.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_query_platform_interface/src/models/song_model.dart';

class HomeRepoImp implements HomeRepo {
  @override
  Future<List<SongModel>> getAllMusic() async {
    final OnAudioQuery audioQuery = OnAudioQuery();
    List<SongModel> songs = [];
    songs = await audioQuery.querySongs();
    return songs;
  }
}
