import 'package:data/data.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodo({
    bool force = false,
  });

  Future<Todo> getTodo(int id);
}
