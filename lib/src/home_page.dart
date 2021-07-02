import 'package:flutter/material.dart';
import 'package:todo_list/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    homeController.start();
    super.initState();
  }

  _success() {
    return ListView.builder(
      itemCount: homeController.todos.length,
      itemBuilder: (context, index) {
        var todo = homeController.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) {
              setState(() {
                todo.completed = value!;
              });
            },
          ),
          title: Text(todo.title),
        );
      },
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        onPressed: homeController.start,
        child: Text('Tentar Novamente'),
      ),
    );
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
        return _success();
      default:
        return _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Todo\'s'),
        actions: [
          IconButton(
            onPressed: () {
              homeController.start();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: homeController.state,
        builder: (context, child) {
          return stateManagement(homeController.state.value);
        },
      ),
    );
  }
}
