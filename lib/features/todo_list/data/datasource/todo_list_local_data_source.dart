import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';

import '../models/todo_list_model.dart';

abstract class TodoListLocalDataSource {
  Future<List<TodoListModel>> getTodoList();
  Future<List<TodoListEntity>> addTodoList(TodoListModel item);
}

const _key = 'key';

@LazySingleton(as: TodoListLocalDataSource)
class TodoListLocalDataSourceImpl implements TodoListLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoListLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TodoListModel>> getTodoList() async {
    final data = sharedPreferences.getString(_key);
    if (data == null) return [];
    final jsonList = json.decode(data);
    if(jsonList is! List) return [];
    final result = jsonList.map((e) => TodoListModel.fromJson(e)).toList();
    return result;
  }
  
  @override
  Future<List<TodoListEntity>> addTodoList(TodoListModel item) async {
    final oldItems = await getTodoList();
    final id = oldItems.isEmpty? 1 : oldItems.last.id + 1;
    //adding item to the end of list<model>
    final newItems = [...oldItems, item.copyWith(id: id)];
    final data = json.encode(newItems.map((e) => e.toJson).toList());
    await sharedPreferences.setString(_key, data);
    return newItems;
  }
}
