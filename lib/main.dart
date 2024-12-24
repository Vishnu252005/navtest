import 'package:flutter/material.dart';
import 'package:bus_route_navigator/app/app.dart';
import 'package:bus_route_navigator/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const BusRouteNavigatorApp());
}