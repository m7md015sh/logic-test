import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logic/logic/task_cubit/task_cubit.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                final cubit = context.read<TaskCubit>();
                return Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'add task',
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (controller.text.isEmpty) {
                          return;
                        }
                        cubit.addTask(controller.text);
                        controller.clear();
                      },
                      child: Text('data'),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.tasks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.tasks[index].title),

                            leading: Checkbox(
                              value: state.tasks[index].isSelected,
                              onChanged: (value) {
                                cubit.toggleTask(state.tasks[index].id);
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                cubit.removeTask(state.tasks[index].id);
                              },
                            ),
                          );
                        },
                      ),
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
