import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Todo\'s'),
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('teste'),
            );
          },
        ));
  }
}
