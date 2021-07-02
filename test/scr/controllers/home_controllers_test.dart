import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list/src/controllers/home_controller.dart';
import 'package:todo_list/src/models/todo_model.dart';
import 'package:todo_list/src/repositories/todo_repository.dart';

class TodoRepositoryMock extends Mock implements TodoRepository {}

main() {
  final todoRepository = TodoRepositoryMock();
  final homeController = HomeController(todoRepository);
  test('deve preencher variavel todos', () async {
    when(() => todoRepository.fetchTodos()).thenAnswer((_) async => [
          TodoModel(
              userId: 1, id: 1, title: 'delectus aut autem', completed: false)
        ]);

    expect(homeController.state, HomeState.start);

    await homeController.start();
    expect(homeController.state, HomeState.success);
    final todos = homeController.todos;
    expect(todos.isNotEmpty, true);
  });
  test('deve modificar o estado para error se a requisição falhar', () async {
    when(() => todoRepository.fetchTodos()).thenThrow(Exception());

    expect(homeController.state, HomeState.start);

    await homeController.start();
    expect(homeController.state, HomeState.error);
  });
}
