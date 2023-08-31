import 'package:data/data.dart';
import 'package:data/src/model/author.dart';

class TodoWithAuthor extends Todo {
  final Author author;

  TodoWithAuthor({
    required super.id,
    required super.title,
    required super.authorId,
    required this.author,
  });
}
