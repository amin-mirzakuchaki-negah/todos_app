import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list.dart';

import '../models/todo_list_model.dart';

abstract class TodoListLocalDataSource {
  Future<List<TodoListEntity>> getTodoList();
}

const _key = 'key';

class TodoListLocalDataSourceImpl implements TodoListLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoListLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TodoListEntity>> getTodoList() async {
    final data = sharedPreferences.getString(_key);
    if (data == null) return [];
    final jsonList = json.decode(data);
    if(jsonList is! List) return [];
    final result = jsonList.map((e) => TodoListModel.fromJson(e)).toList();
    return result;
  }
}
