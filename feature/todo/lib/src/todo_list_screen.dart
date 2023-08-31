import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/todo_list_bloc.dart';

class TodoListScreen extends StatelessWidget {
  final ValueChanged<int> onDetail;

  const TodoListScreen({
    super.key,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List Screen'),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        bloc: TodoListBloc(todoRepository: context.read<TodoRepository>())
          ..fetchTodo(),
        builder: (context, state) {
          return Visibility(
            visible: state is! TodoListInProgress,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return InkWell(
                  onTap: () => onDetail(todo.id),
                  child: Text(todo.title),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
