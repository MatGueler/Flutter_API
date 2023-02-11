import 'package:app_api/src/Controller/Home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  _start() {
    return Container();
  }

  _error() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            controller.start();
          },
          child: const Text('Tentar novamente')),
    );
  }

  _success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var todo = controller.todos[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text('${index + 1} - ${todo.title}'),
        );
      },
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
      case HomeState.loading:
        return _loading();
      default:
        return _start();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) {
              return stateManagement(controller.state.value);
            },
          ),
        ));
  }
}
