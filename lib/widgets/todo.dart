import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_to_to_manager/small_classes.dart';

class ToDo extends StatefulWidget {
  const ToDo({
    super.key,
    required this.task,
    required this.description,
    required this.done,
    this.deadline,
    this.link,
    this.assignedTo,
  });

  final String task;
  final String description;
  final User? assignedTo;
  final int? deadline;
  final bool done;
  final Link? link;

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.done)
            const Icon(Icons.task_rounded)
          else
            const Icon(Icons.label_important),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(
                      () => showFullDescription = !showFullDescription),
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    firstChild: Text(
                      widget.description,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    secondChild: Text(
                      widget.description,
                      softWrap: true,
                    ),
                    crossFadeState: showFullDescription
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                  ),
                ),
                const SizedBox(height: 8),
                if (widget.assignedTo != null && !widget.done)
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 5),
                        const Text("Assigned to: "),
                        InkWell(
                          child:
                              Text(widget.assignedTo?.name ?? "<missing name>"),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                if (widget.deadline != null && widget.deadline != 0) Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today_rounded),
                      const SizedBox(width: 10),
                      const Text("Deadline: "),
                      Text(DateFormat.yMEd().format(
                        DateTime.fromMicrosecondsSinceEpoch(
                            (widget.deadline ?? 0) * 1000000),
                      )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.assignedTo == null)
                      FilledButton(
                        onPressed: () {},
                        child: const Text("Assign yourself"),
                      )
                    else
                      FilledButton(
                        onPressed: () {},
                        child: const Text("Unassign"),
                      ),
                    const SizedBox(width: 8),
                    if (widget.done != true)
                      FilledButton(
                        onPressed: () {},
                        child: const Text("Mark done"),
                      )
                    else
                      FilledButton(
                        onPressed: () {},
                        child: const Text("Not done yet"),
                      )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
