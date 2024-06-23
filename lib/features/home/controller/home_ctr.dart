import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saidoffapp/core/services/todo/todo.dart';
import 'package:saidoffapp/data/todomodel.dart';

final homeController = ChangeNotifierProvider((ref) => HomeController());

class HomeController extends ChangeNotifier {
  HomeController() {
    getTodo();
  }
  final massage = TextEditingController();

  void getTodo() async {
    await TodoService.getTodo();
    notifyListeners();
  }

  void postTodo(TodoModel data) async {
    await TodoService.posTodo(data);
    getTodo();
    notifyListeners();
  }

  void deleteTodo(String id) async {
  await  TodoService.deleteTodo(id);
    getTodo();
    notifyListeners();
  }
}
