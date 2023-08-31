import 'package:data/src/model/author.dart';

class MockAuthorResource {
  Future<List<Author>> getAll() async {
    await Future.delayed(Duration.zero);
    return [
      Author(id: 1, name: 'MOCK AUTHOR #1'),
      Author(id: 2, name: 'MOCK AUTHOR #2'),
      Author(id: 3, name: 'MOCK AUTHOR #3'),
    ];
  }
}