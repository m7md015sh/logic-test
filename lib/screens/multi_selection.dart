import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logic/data/local/app_database.dart';

import '../logic/task_cubit/task_cubit.dart';
import '../logic/task_cubit/task_state.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(AppDatabase()),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                final cubit = context.read<TaskCubit>();

                return Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Add task',
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          cubit.addTask(controller.text);
                          controller.clear();
                        }
                      },
                      child: const Text('Add'),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: state is UpdateTask
                          ? ListView.builder(
                              itemCount: state.tasks.length,
                              itemBuilder: (context, index) {
                                final task = state.tasks[index];
                                return ListTile(
                                  title: Text(task.title),
                                  leading: Checkbox(
                                    value: task.isSelected,
                                    onChanged: (_) {
                                      cubit.toggleTask(task.id);
                                    },
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      cubit.deleteTask(task.id);
                                    },
                                  ),
                                );
                              },
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
