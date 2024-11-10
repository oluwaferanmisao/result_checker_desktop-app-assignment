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
      appBar: AppBar(
        title: Center(
          child: Text('Results Page'),
        ),
      ),
      body: Column(
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
    );
  }
}
