import 'package:dio/dio.dart';
import 'package:todo_list/src/models/todo_model.dart';

class TodoRepository {
  late Dio dio;
  final baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) : this.dio = client ?? Dio();

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(baseUrl);
    final list = response.data as List;

    List<TodoModel> todos = list.map((e) => TodoModel.fromJson(e)).toList();

    return todos;
  }
}
