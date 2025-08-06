import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logic/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  void addTask(String taskTile) {
    emit(UpdateTask([...state.tasks, TaskModel(Uuid().v4(), taskTile, false)]));
  }

  void removeTask(String taskID) {
    final List<TaskModel> newList = state.tasks
        .where((task) => task.id != taskID)
        .toList();
    emit(UpdateTask(newList));
  }

  void toggleTask(String taskID) {
    final List<TaskModel> newList = state.tasks.map((task) {
      if (task.id == taskID) {
        return task.copyWith(isSelected: !task.isSelected);
      }
      return task;
    }).toList();
    emit(UpdateTask(newList));
  }
}
