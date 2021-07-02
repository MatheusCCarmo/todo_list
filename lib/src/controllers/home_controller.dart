import 'package:flutter/cupertino.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  late TodoRepository _todoRepository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([TodoRepository? todoRepo])
      : _todoRepository = todoRepo ?? TodoRepository();

  Future<void> start() async {
    state.value = HomeState.loading;
    try {
      todos = await _todoRepository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
