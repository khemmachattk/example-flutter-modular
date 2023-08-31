import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo.dart';
import 'package:todo_app/di.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        routes: {
          '/': (context) {
            return TodoListScreen(
              onDetail: (id) => Navigator.pushNamed(
                context,
                '/detail',
                arguments: id,
              ),
            );
          },
          '/detail': (context) {
            final id = ModalRoute.of(context)!.settings.arguments as int;
            return TodoScreen(id: id);
          },
        },
      ),
    );
  }
}