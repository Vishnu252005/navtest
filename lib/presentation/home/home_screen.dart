import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bus_route_navigator/presentation/home/widgets/map_widget.dart';
import 'package:bus_route_navigator/presentation/home/widgets/search_bar_widget.dart';
import 'package:bus_route_navigator/presentation/home/widgets/bottom_sheet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MapWidget(),
          const Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: SearchBarWidget(),
          ),
          const BusStopBottomSheet(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement location centering
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}