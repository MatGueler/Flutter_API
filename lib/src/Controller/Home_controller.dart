import 'package:app_api/src/Models/Todo_model.dart';
import 'package:app_api/src/Repositories/Todo_repository.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<TodoModel> todos = [];
  final TodoRepository _repository;

  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([TodoRepository? repository])
      : _repository = repository ?? TodoRepository();

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
    } catch (error) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, success, loading, error }
