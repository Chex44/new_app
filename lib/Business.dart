import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          'Business',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}