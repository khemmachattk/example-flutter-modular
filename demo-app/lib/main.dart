import 'package:demo_app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menu/menu.dart';
import 'package:todo/todo.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        title: 'TODO APP',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) {
            return MenuScreen(
              onTodoMenu: () => Navigator.pushNamed(context, '/todo'),
              onHelloMenu: () => debugPrint('Hello World'),
            );
          },
          '/todo': (context) {
            return TodoListScreen(
              onDetail: (id) => Navigator.pushNamed(
                context,
                '/todo-detail',
                arguments: id,
              ),
            );
          },
          '/todo-detail': (context) {
            final id = ModalRoute.of(context)!.settings.arguments as int;
            return TodoScreen(id: id);
          },
        },
      ),
    );
  }
}
