import 'package:data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListState {
  final List<Todo> todos;

  TodoListState({
    required this.todos,
  });
}

class TodoListInProgress extends TodoListState {
  TodoListInProgress({required super.todos});
}

class TodoListBloc extends Cubit<TodoListState> {
  final TodoRepository todoRepository;

  TodoListBloc({
    required this.todoRepository,
  }) : super(TodoListState(todos: []));

  Future fetchTodo() async {
    emit(TodoListInProgress(todos: state.todos));
    final todos = await todoRepository.fetchTodo();
    emit(TodoListState(todos: todos));
  }
}
