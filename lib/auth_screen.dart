import 'package:flutter/material.dart';
import 'hello_world_screen.dart'; // Импортируем новый файл

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, String> _users = {};

  String _message = '';

  void _register() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Пожалуйста, заполните все поля!';
      });
      return;
    }

    if (_users.containsKey(email)) {
      setState(() {
        _message = 'Пользователь с таким email уже существует!';
      });
      return;
    }

    _users[email] = password;

    setState(() {
      _message = 'Регистрация прошла успешно!';
    });
  }

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Пожалуйста, заполните все поля!';
      });
      return;
    }

    if (!_users.containsKey(email)) {
      setState(() {
        _message = 'Пользователь не найден!';
      });
      return;
    }

    if (_users[email] != password) {
      setState(() {
        _message = 'Неверный пароль!';
      });
      return;
    }

    // Переход на новый экран
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HelloWorldScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Пароль'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _register,
            child: Text('Зарегистрироваться'),
          ),
          ElevatedButton(
            onPressed: _login,
            child: Text('Войти'),
          ),
          SizedBox(height: 20),
          Text(_message, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}