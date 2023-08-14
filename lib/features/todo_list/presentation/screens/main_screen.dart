import 'package:flutter/material.dart';
import 'package:todos_app/features/todo_list/presentation/bloc/todo_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/features/todo_list/presentation/screens/add_todo_screen.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/empty_list.dart';

import '../../../../injection_container.dart';
import '../widgets/loading_display.dart';
import '../widgets/todo_display.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListBloc>(
          create: (context) => getIt<TodoListBloc>(),
        ),
      ],
      child: const _MainScreen(),
    );
  }
}

class _MainScreen extends StatelessWidget {
  const _MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos", style: TextStyle(color: Colors.greenAccent)),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTodoButton(context);
          },
          child: const Icon(Icons.add)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<TodoListBloc, TodoListState>(
          builder: (context, state) {
            if (state is TodoListLoadingState) {
              return const LoadingDisplay();
            } //
            if (state is GetTodoListFromCacheFailureState) {
              return Text(state.message ??
                  "There is problem in getting todos from cache");
            } //

            final items = state.items;
            if (items.isEmpty) {
              return const EmptyList();
            } //
            else {
              return const TodoDisplay();
            }
          },
        ),
      ),
    );
  }

  addTodoButton(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddTodoScreen(),
      ),
    );
  }
}
