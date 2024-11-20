import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final Random _random = Random();
  int _targetNumber = 0;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    _targetNumber = _random.nextInt(100) + 1; // Случайное число от 1 до 100
    _message = 'Угадайте число от 1 до 100!';
  }

  void _checkGuess() {
    int guess = int.tryParse(_controller.text) ?? 0;

    if (guess < 1 || guess > 100) {
      setState(() {
        _message = 'Введите число от 1 до 100!';
      });
    } else if (guess < _targetNumber) {
      setState(() {
        _message = 'Слишком низко! Попробуйте снова.';
      });
    } else if (guess > _targetNumber) {
      setState(() {
        _message = 'Слишком высоко! Попробуйте снова.';
      });
    } else {
      setState(() {
        _message = 'Поздравляем! Вы угадали число! 🎉';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _message,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Введите ваше число',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkGuess,
                child: Text('Проверить'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _controller.clear();
                  _startNewGame();
                  setState(() {});
                },
                child: Text('Начать заново'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}