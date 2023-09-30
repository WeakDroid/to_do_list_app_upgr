import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app_upgr/screens/recycle_bin_screen.dart';
import 'package:to_do_list_app_upgr/screens/tabs_screen.dart';
import '../blocs/switch_bloc/switch_bloc.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  final bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                'To-do App',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushReplacementNamed(TabsScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special_rounded),
                    title: const Text('My Tasks'),
                    trailing: Text(
                        '${state.pendingTasks.length} | ${state.completedTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(RecycleBinScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete_rounded),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Switch(
                        value: state.switchValue,
                        onChanged: (newValue) {
                          newValue
                              ? context.read<SwitchBloc>().add(SwitchOnEvent())
                              : context
                                  .read<SwitchBloc>()
                                  .add(SwitchOffEvent());
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Mode'),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
