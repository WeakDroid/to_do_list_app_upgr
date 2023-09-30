import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app_upgr/widgets/tasks_list.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';
import '../models/task.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                    '${tasksList.length} Pending |${state.completedTasks.length} Completed'),
              ),
            ),
            TasksList(taskList: tasksList),
          ],
        );
      },
    );
  }
}
