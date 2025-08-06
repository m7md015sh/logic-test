import 'package:flutter/cupertino.dart';

import '../../data/local/app_database.dart';
import '../../models/task_model.dart';

@immutable
sealed class TaskState {
  final List<TaskTableData> tasks;
  const TaskState(this.tasks);
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

final class UpdateTask extends TaskState {
  const UpdateTask(super.tasks);
}
