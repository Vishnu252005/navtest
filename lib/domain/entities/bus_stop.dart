import 'package:freezed_annotation/freezed_annotation.dart';

part 'bus_stop.freezed.dart';

@freezed
class BusStop with _$BusStop {
  const factory BusStop({
    required String id,
    required String name,
    required double latitude,
    required double longitude,
    required List<String> busRoutes,
  }) = _BusStop;
}