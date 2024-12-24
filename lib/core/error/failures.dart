abstract class Failure {
  final String message;
  
  const Failure(this.message);
}

class LocationServiceFailure extends Failure {
  const LocationServiceFailure(String message) : super(message);
}

class MapFailure extends Failure {
  const MapFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}