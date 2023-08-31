import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoState {
  final TodoWithAuthor? todo;

  TodoState({
    this.todo,
  });
}

class TodoBloc extends Cubit<TodoState> {
  final GetTodoWithAuthorUseCase getTodoUseCase;

  TodoBloc({
    required this.getTodoUseCase,
  }) : super(TodoState());

  Future<void> getTodo(int id) async {
    final todo = await getTodoUseCase.invoke(id);
    emit(TodoState(todo: todo));
  }
}
