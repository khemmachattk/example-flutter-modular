import 'package:data/data.dart';

class TodoResource {
  Future getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Todo(id: 1, title: 'NETWORK TODO #1', authorId: 1),
      Todo(id: 2, title: 'NETWORK TODO #2', authorId: 2),
      Todo(id: 3, title: 'NETWORK TODO #3', authorId: 3),
    ];
  }

  Future remove(int id) async {
    await Future.delayed(Duration.zero);
    return;
  }
}