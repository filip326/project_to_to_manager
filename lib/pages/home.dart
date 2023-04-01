import 'package:flutter/material.dart';
import 'package:project_to_to_manager/widgets/loading.dart';
import 'package:project_to_to_manager/widgets/project_preview.dart';

import '../small_classes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;

  void loadData() async {
    setState(() {
      _loading = true;
    });
    print("Loading data");
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading == true) {
      return const Scaffold(body: Loading());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Management"),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          ProjectPreview(
            projectTitle: "Hallo Welt",
            projectDescription: "Eine Projektbeschreibung vom Feinstenheb usacnsa0icsac ojascusa kncsancsacksacmuewe jewifoiew weifjew 9wefhoiewnf j fewjubewj lewknviewnvkn ewinw ewovnew knew v0ienvkew pokwnvjew kwne welm0iew knew ebkew iewnewlnew ew pkewnj ew piev knwe v",
            missingTasks: 0,
            totalTasks: 5,
            users: [
              User(
                  name: "heeeecker",
                  discordUrl:
                      "https://discordapp.com/users/768872955500953710/"),
              User(
                  name: "Christian.sh",
                  discordUrl:
                      "https://discordapp.com/users/779419763938951228/"),
              
            ],
            deadline: 1711969404,
            id: "524161653612357",
            githubRepo: GitHub(
                repoName: "meinRepo",
                url: "https://github.com/user123/repo123"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/create-project');
          loadData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
