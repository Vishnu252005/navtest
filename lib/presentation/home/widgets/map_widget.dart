import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(9.5916, 76.5222), // Kottarakara coordinates
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      markers: const {},
    );
  }
}