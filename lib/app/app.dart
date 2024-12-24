import 'package:flutter/material.dart';
import 'package:bus_route_navigator/presentation/home/home_screen.dart';
import 'package:bus_route_navigator/core/theme/app_theme.dart';

class BusRouteNavigatorApp extends StatelessWidget {
  const BusRouteNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Route Navigator',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}