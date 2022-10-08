part of 'space_x_bloc.dart';

@immutable
abstract class SpaceXEvent extends Equatable {
  const SpaceXEvent();
}

class LoadSpaceXEvent extends SpaceXEvent {
  @override
  List<SpaceXLaunchModel?> get props => [];
}

