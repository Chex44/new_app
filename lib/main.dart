import 'package:flutter/material.dart';
import 'auth_screen.dart'; // Импортируйте файл, если AuthScreen находится там

void main() {
  runApp(MyApp());
}

// ignore: non_constant_identifier_names
MaterialApp MyApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Example"),
        titleSpacing: 0.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.00,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: AuthScreen(),
    ),
  );
}

// dw