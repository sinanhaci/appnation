part of 'space_x_bloc.dart';

@immutable
abstract class SpaceXState extends Equatable {
  const SpaceXState();
}

class SpaceXLoadingState extends SpaceXState {
  @override
  List<SpaceXLaunchModel> get props => [];
}

class SpaceXLoadState extends SpaceXState {
  final SpaceXLaunchModel? spaceXModel;

  const SpaceXLoadState(this.spaceXModel);

  @override
  List<SpaceXLaunchModel?> get props => [spaceXModel];
}


