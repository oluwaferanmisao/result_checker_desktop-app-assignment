import 'dart:math';

import 'package:flutter/material.dart';
import 'package:result_checker/models/students.dart';
import 'package:result_checker/pages/results.dart';
import 'package:result_checker/students_data.dart';

class CoursesSearch extends StatefulWidget {
  const CoursesSearch({super.key});

  @override
  State<CoursesSearch> createState() => _CoursesSearchState();
}

class _CoursesSearchState extends State<CoursesSearch> {
  String? selectedCourse;
  List<String> courses = [
    'CSC101',
    'MAT102',
    'PHY105',
    'ENG201',
    'BIO110',
    'HIS205',
    'CHM120',
    'ECO101',
    'PSY100',
    'SOC150',
  ];

  void showResult() {
    if (selectedCourse != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(course: selectedCourse!),
        ),
      );
    } else {
      // Handle case where no course is selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a course')),
      );
    }
  }

  void cumulResult() {
    for (var map in students) {
      if (map['results'] != null) {
        var values = map['results'].values.toList();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('$courses: \n$values'),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenWidth * 0.03;
    double verticalPadding = screenHeight * 0.01;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DropdownButton(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              items: courses.map((course) {
                return DropdownMenuItem(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
              hint: Text(
                'Select a course ',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).colorScheme.primary,
              ),
              dropdownColor: Theme.of(context).colorScheme.surface,
              value: selectedCourse,
              elevation: 3,
              borderRadius: BorderRadius.circular(8),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),
          ),

          SizedBox(height: 25),

          // Button Widget
          ElevatedButton.icon(
            onPressed: showResult,
            label: Text('Show Result!'),
            icon: Icon(Icons.arrow_forward),
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          SizedBox(height: 15),

          // Second button widget
          ElevatedButton.icon(
            onPressed: cumulResult,
            label: Text('Cumulative Result'),
            icon: Icon(Icons.plus_one_outlined),
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String course;
  int randomNumber = Random().nextInt(80) + 10;

  ResultScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$course Result')),
      body: Center(
        child: Text('Score for $course is $randomNumber'),
      ),
    );
  }
}
