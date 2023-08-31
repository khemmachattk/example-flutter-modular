import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sw_data/sw_data.dart';

final providers = [
  ..._repositories,
  ..._useCases,
];

final _repositories = [
  RepositoryProvider<TodoRepository>(
    create: (_) => NetworkTodoRepository(
      todoResource: TodoResource(),
      todoDao: TodoDao(),
    ),
  ),
  RepositoryProvider<AuthorRepository>(
    create: (_) => MockAuthorRepository(
      mockAuthorResource: MockAuthorResource(),
    ),
  ),
];

final _useCases = [
  RepositoryProvider<GetTodoWithAuthorUseCase>(
    create: (context) => GetTodoWithAuthorUseCase(
      todoRepository: context.read<TodoRepository>(),
      authorRepository: context.read<AuthorRepository>(),
    ),
  ),
];
