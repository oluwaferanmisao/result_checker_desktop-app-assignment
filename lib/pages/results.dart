import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({
    super.key,
    required this.results,
  });
  final Map<String, dynamic> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Center(
          child: Text('Results Page'),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/The McPherson University logo.jpg',
                // color: Colors.grey,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: results.entries.map((entry) {
              return Center(
                child: Text(
                  '${entry.key}: \t${entry.value}',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
