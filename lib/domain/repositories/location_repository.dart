import 'package:dartz/dartz.dart';
import 'package:bus_route_navigator/core/error/failures.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<Either<Failure, Position>> getCurrentLocation();
  Future<bool> checkLocationPermission();
  Future<void> requestLocationPermission();
}