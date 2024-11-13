import 'package:flutter/material.dart';

class CoursesSearch extends StatefulWidget {
  const CoursesSearch({super.key});

  @override
  State<CoursesSearch> createState() => _CoursesSearchState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(value: "CSC101", child: Text("CSC101")),
    DropdownMenuItem(value: "MAT102", child: Text("MAT102")),
    DropdownMenuItem(value: "PHY105", child: Text("PHY105")),
    DropdownMenuItem(value: "ENG201", child: Text("ENG201")),
    DropdownMenuItem(value: "BIO110", child: Text("BIO110")),
    DropdownMenuItem(value: "HIS205", child: Text("HIS205")),
    DropdownMenuItem(value: "CHM120", child: Text("CHM120")),
    DropdownMenuItem(value: "ECO101", child: Text("ECO101")),
    DropdownMenuItem(value: "PSY100", child: Text("PSY100")),
    DropdownMenuItem(value: "SOC150", child: Text("SOC150")),
  ];
  return menuItems;
}

class _CoursesSearchState extends State<CoursesSearch> {
  var _selectedCourse;

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
              items: dropdownItems,
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
              value: _selectedCourse,
              elevation: 3,
              borderRadius: BorderRadius.circular(8),
              onChanged: (selectedCourse) {
                setState(() {
                  _selectedCourse = selectedCourse;
                });
              },
            ),
          ),

          SizedBox(height: 25),

          // Button Widget
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('Search'),
            icon: Icon(Icons.arrow_forward),
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
