import 'package:appnation/models/space_x_launch_models/space_x_launch_model.dart';
import 'package:appnation/services/api_services/space_x_api_services/space_x_api_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'space_x_event.dart';
part 'space_x_state.dart';

class SpaceXBloc extends Bloc<SpaceXEvent, SpaceXState> {
  final SpaceXApiServices _apiServices;


  SpaceXBloc(this._apiServices) : super(SpaceXLoadingState())  {
    on<SpaceXEvent>((event, emit) async {
      emit(SpaceXLoadingState());
      final result =  await _apiServices.getLastMission();
      emit(SpaceXLoadState(result?.first));
    });
  }
}
