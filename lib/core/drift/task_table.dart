import 'package:drift/drift.dart';

class TaskTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  BoolColumn get isSelected => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
