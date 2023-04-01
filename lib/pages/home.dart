import 'package:flutter/material.dart';
import 'package:project_to_to_manager/widgets/project_preview.dart';

import '../small_classes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Project Management"),
          centerTitle: true,
        ),
        body: ListView(
          children: const [
            ProjectPreview(
              projectTitle: "Hallo Welt",
              projectDescription:
                  "Eine Projektbeschreibung vom Feinsten",
              missingTasks: 0,
              totalTasks: 5,
              users: [
                User(name: "heeeecker", discordUrl: "discord.gg"),
                User(name: "Christian.sh", discordUrl: "discord.gg"),
              ],
              deadline: 1711969404,
              id: "524161653612357",
              githubRepo: GitHub(repoName: "meinRepo", url: "https://github.com/user123/repo123"),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        );
  }
}
