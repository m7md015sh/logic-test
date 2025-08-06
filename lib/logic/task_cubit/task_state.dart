part of 'task_cubit.dart';

@immutable
sealed class TaskState {
  final List<TaskModel> tasks;
  const TaskState(this.tasks);
}

final class TaskInitial extends TaskState {
  TaskInitial() : super([]);
}

final class UpdateTask extends TaskState {
  const UpdateTask(super.tasks);
}
