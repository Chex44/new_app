import 'package:flutter/material.dart';
import 'package:new_app/Business.dart';
import 'package:new_app/School.dart';
import 'home.dart'; // Импортируем новый экран

class HelloWorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Убираем текст заголовка
        backgroundColor: Colors.green, // Устанавливаем цвет для AppBar
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Иконка для открытия Drawer
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Открытие Drawer
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Отступы вокруг текста
        child: Align(
          alignment: Alignment.center, // Выравнивание по левому краю
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      drawer: Drawer( // Добавляем Drawer здесь
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Закрываем Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Переход на новый экран
                );
              },
            ),
            ListTile(
              title: const Text('Business'),
              onTap: () {
                Navigator.pop(context); // Закрываем Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BusinessScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('School'),
              onTap: () {
                Navigator.pop(context); // Закрываем Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchoolScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HelloWorldScreen(),
  ));
}