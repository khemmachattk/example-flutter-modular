import 'package:data/data.dart';

class GetTodoWithAuthorUseCase {
  final TodoRepository todoRepository;
  final AuthorRepository authorRepository;

  GetTodoWithAuthorUseCase({
    required this.todoRepository,
    required this.authorRepository,
  });

  Future<TodoWithAuthor> invoke(int id) async {
    final todo = await todoRepository.getTodo(id);
    final author = await authorRepository.getAuthor(todo.authorId);
    return TodoWithAuthor(
      id: id,
      title: todo.title,
      authorId: todo.authorId,
      author: author,
    );
  }
}
