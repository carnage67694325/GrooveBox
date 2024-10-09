part of 'get_music_cubit.dart';

@immutable
sealed class GetMusicState {}

final class GetMusicInitial extends GetMusicState {}

final class GetMusicSuccess extends GetMusicState {
  final List<SongModel> songs;

  GetMusicSuccess({required this.songs});
}

final class GetMusicLoading extends GetMusicState {}

final class GetMusicFailure extends GetMusicState {
  final String errMessage;

  GetMusicFailure({required this.errMessage});
}
