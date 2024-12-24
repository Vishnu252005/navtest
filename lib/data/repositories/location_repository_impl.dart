import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:bus_route_navigator/core/error/failures.dart';
import 'package:bus_route_navigator/domain/repositories/location_repository.dart';

@Injectable(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Either<Failure, Position>> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      return Right(position);
    } catch (e) {
      return Left(LocationServiceFailure(e.toString()));
    }
  }

  @override
  Future<bool> checkLocationPermission() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always || 
           permission == LocationPermission.whileInUse;
  }

  @override
  Future<void> requestLocationPermission() async {
    await Geolocator.requestPermission();
  }
}