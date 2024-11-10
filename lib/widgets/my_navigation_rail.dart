import 'package:flutter/material.dart';

class MyNavigationRail extends StatefulWidget {
  const MyNavigationRail({super.key});

  @override
  State<MyNavigationRail> createState() => _MyNavigationRailState();
}

class _MyNavigationRailState extends State<MyNavigationRail> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: _selectedIndex,
      destinations: _buildDestinations(),
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  List<NavigationRailDestination> _buildDestinations() {
    Icon icon = Icon(Icons.check_circle_outline);

    return [
      NavigationRailDestination(
        icon: icon,
        label: Text('Menu 1'),
      ),
      NavigationRailDestination(
        icon: icon,
        label: Text('Menu 2'),
      ),
      NavigationRailDestination(
        icon: icon,
        label: Text("Menu 3"),
      ),
    ];
  }
}
