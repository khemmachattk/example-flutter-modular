import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/todo_bloc.dart';

class TodoScreen extends StatelessWidget {
  final int id;

  const TodoScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: TodoBloc(
          getTodoUseCase: context.read<GetTodoWithAuthorUseCase>(),
        )..getTodo(id),
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${state.todo?.title}'),
                Text('by: ${state.todo?.author.name}')
              ],
            ),
          );
        },
      ),
    );
  }
}
