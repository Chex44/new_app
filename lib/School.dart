import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'School',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}