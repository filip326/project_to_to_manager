import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProjectCreate extends StatefulWidget {
  const ProjectCreate({ Key? key, this.id }) : super(key: key);

  final String? id;

  @override
  State<ProjectCreate> createState() => _ProjectCreateState();
}

class _ProjectCreateState extends State<ProjectCreate> {
  String? projectName;
  String? projectDescription;
  bool projectPriority = false;
  bool notifications = true;
  DateTime? deadline;
  final TextEditingController _projectName = TextEditingController();
  final TextEditingController _projectDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectName ?? "New Project"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _projectName,
              maxLength: 32,
              decoration: const InputDecoration(
                labelText: "Project Name",
              ),
              onChanged: (String text) {
                setState(() {
                  if (text.isEmpty) {
                    projectName = null;
                  } else {
                    projectName = text;
                  }
                });
              },
            ),
            TextField(
              controller: _projectDescription,
              maxLines: null,
              maxLength: 2048,
              decoration: const InputDecoration(
                labelText: "Project Description",
              ),
              onEditingComplete: () {
                setState(() {
                  if (_projectDescription.text.isEmpty) {
                    projectDescription = null;
                  } else {
                    projectDescription = _projectDescription.text;
                  }
                });
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Flex(direction: Axis.horizontal, children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now().add(const Duration(
                            days: 7,
                          )),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(9999));

                      if (picked != null) {
                        setState(() {
                          deadline = picked;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const Icon(Icons.event),
                          const SizedBox(
                            width: 8,
                          ),
                          if (deadline != null)
                            Text(DateFormat.yMEd()
                                .format(deadline ?? DateTime(0)))
                          else
                            const Text("Pick date"),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Priorität:"),
                  Switch(
                      value: projectPriority,
                      onChanged: (bool value) {
                        setState(() {
                          projectPriority = value;
                        });
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Push-Benachrichtigungen:"),
                  Switch(
                      value: notifications,
                      onChanged: (bool value) {
                        setState(() {
                          notifications = value;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
