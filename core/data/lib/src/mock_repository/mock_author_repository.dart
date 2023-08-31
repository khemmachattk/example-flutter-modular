import 'package:data/src/mock_resource/mock_author_resource.dart';
import 'package:data/src/model/author.dart';
import 'package:data/src/repository/author_repository.dart';

class MockAuthorRepository extends AuthorRepository {
  final MockAuthorResource mockAuthorResource;

  MockAuthorRepository({
    required this.mockAuthorResource,
  });

  @override
  Future<List<Author>> fetchAuthor({force = false}) async {
    final authors = await mockAuthorResource.getAll();
    return authors;
  }

  @override
  Future<Author> getAuthor(int id) async {
    final authors = await mockAuthorResource.getAll();
    return authors.firstWhere((element) => element.id == id);
  }
}
