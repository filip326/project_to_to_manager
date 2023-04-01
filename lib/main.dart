import 'package:flutter/material.dart';
import 'package:project_to_to_manager/pages/create_project.dart';
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
        primaryColor: const Color.fromARGB(255, 9, 126, 169),
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromARGB(255, 0, 25, 45),
          primarySwatch: Colors.blue,
          accentColor: Colors.blue[600],
          errorColor: Colors.redAccent,
          cardColor: Color.fromARGB(255, 0, 2, 22),
          brightness: Brightness.dark,
        ),
      ),
      routes: {
        '/': (context) {
          return const Home();
        },
        '/create-project': (context) {
          return const ProjectCreate();
        }
      },
    );
  }
}
