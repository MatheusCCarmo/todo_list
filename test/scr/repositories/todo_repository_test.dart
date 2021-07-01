import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

main() {
  final repository = TodoRepository();
  test('deve trazer uma lista de TodoModel', () async {
    final list = await repository.fetchTodos();
    print(list);
  });
}
