import "package:flutter/material.dart";
import "package:project_to_to_manager/widgets/todo.dart";

import "../small_classes.dart";

class ProjectPage extends StatefulWidget {
  const ProjectPage({
    super.key,
    required this.projectTitle,
    required this.id,
  });

  final String id;
  final String projectTitle;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.projectTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: const [
            ToDo(
              task: "Schach spielen",
              description: "und gewinnen",
              done: false,
              assignedTo: User(
                name: "heeecker",
                discordUrl: "discord.gg",
              ),
            )
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
