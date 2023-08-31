import 'package:data/data.dart';

class MockTodoResource {
  Future<List<Todo>> getAll() async {
    await Future.delayed(Duration.zero);
    return [
      Todo(id: 1, title: 'MOCK TODO #1', authorId: 1),
      Todo(id: 2, title: 'MOCK TODO #2', authorId: 2),
      Todo(id: 3, title: 'MOCK TODO #3', authorId: 3),
    ];
  }
}