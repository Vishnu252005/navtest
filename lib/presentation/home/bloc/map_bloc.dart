import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:bus_route_navigator/domain/repositories/location_repository.dart';

part 'map_event.dart';
part 'map_state.dart';
part 'map_bloc.freezed.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationRepository _locationRepository;

  MapBloc(this._locationRepository) : super(const MapState.initial()) {
    on<MapEvent>((event, emit) async {
      await event.map(
        started: (_) async => _onStarted(emit),
        locationRequested: (_) async => _onLocationRequested(emit),
      );
    });
  }

  Future<void> _onStarted(Emitter<MapState> emit) async {
    final hasPermission = await _locationRepository.checkLocationPermission();
    if (!hasPermission) {
      await _locationRepository.requestLocationPermission();
    }
  }

  Future<void> _onLocationRequested(Emitter<MapState> emit) async {
    emit(const MapState.loading());
    final locationResult = await _locationRepository.getCurrentLocation();
    emit(
      locationResult.fold(
        (failure) => MapState.error(failure.message),
        (location) => MapState.loaded(location),
      ),
    );
  }
}