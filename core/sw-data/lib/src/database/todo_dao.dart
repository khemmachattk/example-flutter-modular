import 'package:data/data.dart';

class TodoDao {
  Future<List<Todo>?> getAll() async {
    await Future.delayed(Duration.zero);
    return [
      Todo(id: 1, title: 'DATABASE TODO #1', authorId: 1),
      Todo(id: 2, title: 'DATABASE TODO #2', authorId: 2),
      Todo(id: 3, title: 'DATABASE TODO #3', authorId: 3),
    ];
  }

  Future saveTodo(List<Todo> todos) async {
    return;
  }
}