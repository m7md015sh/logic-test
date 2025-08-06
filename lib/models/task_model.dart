import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;
  final bool isSelected;

  const TaskModel(this.id, this.title, this.isSelected);

  TaskModel copyWith({String? id, String? title, bool? isSelected}) {
    return TaskModel(
      id ?? this.id,
      title ?? this.title,
      isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [id, title, isSelected];
}
