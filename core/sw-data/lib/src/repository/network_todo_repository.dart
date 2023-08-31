import 'package:data/data.dart';
import 'package:sw_data/src/database/todo_dao.dart';
import 'package:sw_data/src/network_resource/todo_resource.dart';

class NetworkTodoRepository extends TodoRepository {
  final TodoResource todoResource;
  final TodoDao todoDao;

  List<Todo>? currentTodos;

  NetworkTodoRepository({
    required this.todoResource,
    required this.todoDao,
  });

  @override
  Future<Todo> getTodo(int id) async {
    await fetchTodo();
    return currentTodos!.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<Todo>> fetchTodo({ force = false }) async {
    if (currentTodos == null || force) {
      List<Todo>? todos = [];
      try {
        todos = await todoResource.getAll();
        todoDao.saveTodo(todos!);
      } catch (e) {
        todos = await todoDao.getAll();
      }
      currentTodos = todos;
    }
    return currentTodos ?? [];
  }
}
