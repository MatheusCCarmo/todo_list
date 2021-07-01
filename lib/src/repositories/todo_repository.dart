import 'package:dio/dio.dart';
import 'package:todo_list/src/models/todo_model.dart';

class TodoRepository {
  final dio = Dio();
  final baseUrl = 'https://jsonplaceholder.typicode.com/todos/1';

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(baseUrl);
    final list = response.data as List;
    List<TodoModel> todos =
        list.map((e) => TodoModel.fromJson(e)) as List<TodoModel>;
    return todos;
  }
}
