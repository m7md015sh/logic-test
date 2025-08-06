import 'package:drift/drift.dart';
import 'package:logic/data/local/app_database.dart';

class TaskLocalService {
  final AppDatabase db;

  TaskLocalService(this.db);

  Future<List<TaskTableData>> getAllTasks() => db.select(db.taskTable).get();
  Future<void> insertTask(TaskTableData task) =>
      db.into(db.taskTable).insert(task);
  Future<void> deleteTask(String id) =>
      (db.delete(db.taskTable)..where((tbl) => tbl.id.equals(id))).go();

  Future<void> updateTaskSelection(String id, bool newValue) {
    return (db.update(db.taskTable)..where((t) => t.id.equals(id))).write(
      TaskTableCompanion(isSelected: Value(newValue)),
    );
  }
}
