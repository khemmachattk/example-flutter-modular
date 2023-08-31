import 'package:data/src/model/author.dart';

abstract class AuthorRepository {
  Future<List<Author>> fetchAuthor({ force = false });
  Future<Author> getAuthor(int id);
}