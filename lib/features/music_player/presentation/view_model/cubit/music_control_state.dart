part of 'music_control_cubit.dart';

@immutable
abstract class MusicControlState {}

class MusicControlInitial extends MusicControlState {}

class MusicLoadingState extends MusicControlState {}

class MusicPlayingState extends MusicControlState {
  final SongModel song;

  MusicPlayingState(this.song);
}

class MusicPausedState extends MusicControlState {
  final SongModel song;

  MusicPausedState({required this.song});
}

class MusicForwardedState extends MusicControlState {}

class MusicBackwardedState extends MusicControlState {}

class MusicNextState extends MusicControlState {}

class MusicPreviousState extends MusicControlState {}

class MusicErrorState extends MusicControlState {
  final String errMessage;

  MusicErrorState(this.errMessage);
}
