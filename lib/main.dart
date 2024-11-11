import 'package:flutter/material.dart';
import 'package:result_checker/pages/home_screen.dart';

var kcolorScheme = ColorScheme.fromSeed(
  seedColor: Color(0xFF2A3663),
);

void main() {
  // Flutter's run app statement
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: kcolorScheme,
      ),
      home: HomeScreen(),
    ),
  );
}
