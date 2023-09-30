import 'package:flutter/material.dart';
import 'package:to_do_list_app_upgr/widgets/task_tile.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
            children: taskList
                .map((task) => ExpansionPanelRadio(
                    value: task.id,
                    headerBuilder: (context, isOpen) => TaskTile(task: task),
                    body: ListTile(
                      title: SelectableText.rich(TextSpan(children: [
                        const TextSpan(
                            text: 'Text:\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.title),
                        const TextSpan(
                            text: '\n\nDescription:\n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: task.description),
                      ])),
                    )))
                .toList()),
      ),
    );
  }
}
