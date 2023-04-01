import 'package:flutter/material.dart';
import 'package:project_to_to_manager/pages/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo-Liste',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF065775),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromARGB(255, 0, 25, 45),
          primarySwatch: Colors.indigo,
          accentColor: Colors.blue,
          errorColor: Colors.redAccent,
          cardColor: Colors.black,
          brightness: Brightness.dark,
        ),
      ),
      routes: {
        '/': (context) {
          return const Home();
        }
      },
    );
  }
}
