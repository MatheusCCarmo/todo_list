import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  late TodoRepository _todoRepository;

  HomeController([TodoRepository? todoRepo])
      : _todoRepository = todoRepo ?? TodoRepository();

  Future<void> start() async {
    todos = await _todoRepository.fetchTodos();
  }
}
