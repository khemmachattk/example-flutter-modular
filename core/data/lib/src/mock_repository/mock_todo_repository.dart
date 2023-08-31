import 'package:data/data.dart';

class MockTodoRepository extends TodoRepository {
  final MockTodoResource mockTodoResource;

  MockTodoRepository({
    required this.mockTodoResource,
  });

  @override
  Future<Todo> getTodo(int id) async {
    final data = await mockTodoResource.getAll();
    return data.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<Todo>> fetchTodo({force = false}) async {
    return await mockTodoResource.getAll();
  }
}
