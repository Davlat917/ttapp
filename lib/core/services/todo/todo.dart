import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:saidoffapp/core/services/app_urls/urls.dart';
import 'package:saidoffapp/core/services/base_options/base_options.dart';
import 'package:saidoffapp/data/todomodel.dart';

class TodoService {
  static Dio dio = Dio(Baseoption.baseOptionsT);
  static List<TodoModel> list = [];
  static Future<void> getTodo() async {
    var response = await dio.get(Urls.apiGetTodo);
    list = (response.data as List).map((e) => TodoModel.fromJson(e)).toList();
    debugPrint(list.toString());
  }

  static Future<void> posTodo(TodoModel data) async {
    await dio.post(Urls.apiPostTodo,data: data.toJson());
  }  
  
  static Future<void> deleteTodo(String id) async {
    await dio.delete('${Urls.apiPostTodo}$id/',);
  }
}
