import "package:intl/intl.dart";

import "package:flutter/material.dart";
import "package:project_to_to_manager/pages/project.dart";

import "../small_classes.dart";

class ProjectPreview extends StatefulWidget {
  const ProjectPreview({
    Key? key,
    required this.projectTitle,
    required this.projectDescription,
    required this.missingTasks,
    required this.totalTasks,
    required this.users,
    required this.deadline,
    required this.id,
    this.githubRepo,
  }) : super(key: key);

  final String projectTitle;
  final String projectDescription;
  final String id;
  final int deadline;
  final int missingTasks;
  final int totalTasks;

  final List<User> users;

  final GitHub? githubRepo;

  @override
  State<ProjectPreview> createState() => _ProjectPreviewState();
}

class _ProjectPreviewState extends State<ProjectPreview> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.account_tree_outlined,
                      opticalSize: 32, size: 52),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.projectTitle,
                          style: const TextStyle(fontSize: 32),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                        GestureDetector(
                          onTap: () => setState(
                              () => showFullDescription = !showFullDescription),
                          child: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 300),
                            firstChild: Text(
                              widget.projectDescription,
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                            ),
                            secondChild: Text(
                              widget.projectDescription,
                              softWrap: true,
                            ),
                            crossFadeState: showFullDescription
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                const Icon(Icons.group),
                                const SizedBox(width: 10),
                                const Text("Beteiligt: "),
                                ...(widget.users
                                    .map((e) => <Widget>[
                                          InkWell(
                                              onTap: () => {
                                                    // TODO: Open Link e.discordUrl
                                                  },
                                              child: Text(e.name)),
                                          const SizedBox(width: 3),
                                        ])
                                    .expand((e) => e)
                                    .toList())
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today_rounded),
                              const SizedBox(width: 10),
                              const Text("Deadline: "),
                              Text(DateFormat.yMEd().format(
                                DateTime.fromMicrosecondsSinceEpoch(
                                    widget.deadline * 1000000),
                              )),
                            ],
                          ),
                        ),
                        if (widget.githubRepo != null &&
                            widget.githubRepo?.repoName != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              children: [
                                const Icon(Icons.link),
                                const SizedBox(width: 10),
                                const Text("GitHub: "),
                                InkWell(
                                  child: Text(widget.githubRepo?.repoName ??
                                      'Repo Name missing'),
                                  onTap: () => {
                                    // TODO Open Link: githubRepo.url
                                  },
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.missingTasks.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                            ),
                          ),
                          const Text("To-Dos")
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            (widget.totalTasks - widget.missingTasks)
                                .toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 24,
                            ),
                          ),
                          const Text("Tasks done")
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            widget.totalTasks.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const Text("Total tasks")
                        ],
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      // Show button pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProjectPage(
                                  id: widget.id,
                                  projectTitle: widget.projectTitle,
                                )),
                      );
                    },
                    icon: const Icon(Icons.open_in_new),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
