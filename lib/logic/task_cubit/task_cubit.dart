import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:logic/logic/task_cubit/task_state.dart';
import 'package:uuid/uuid.dart';
import 'package:logic/data/local/app_database.dart';

class TaskCubit extends Cubit<TaskState> {
  final AppDatabase db;

  TaskCubit(this.db) : super(TaskInitial()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    final tasks = await db.select(db.taskTable).get();
    emit(UpdateTask(tasks));
  }

  Future<void> addTask(String title) async {
    final newTask = TaskTableCompanion(
      id: Value(const Uuid().v4()),
      title: Value(title),
      isSelected: const Value(false),
    );
    await db.into(db.taskTable).insert(newTask);
    loadTasks();
  }

  Future<void> deleteTask(String id) async {
    await (db.delete(db.taskTable)..where((t) => t.id.equals(id))).go();
    loadTasks();
  }

  Future<void> toggleTask(String id) async {
    final task = await (db.select(
      db.taskTable,
    )..where((t) => t.id.equals(id))).getSingle();
    final updatedTask = TaskTableCompanion(isSelected: Value(!task.isSelected));
    await (db.update(
      db.taskTable,
    )..where((t) => t.id.equals(id))).write(updatedTask);
    loadTasks();
  }
}
