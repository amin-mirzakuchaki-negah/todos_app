import 'package:flutter/material.dart';
import 'package:todos_app/features/todo_list/presentation/bloc/todo_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../widgets/loading_display.dart';
import '../widgets/todo_display.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: BlocProvider(
        create: (context) => getIt<TodoListBloc>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: BlocBuilder<TodoListBloc, TodoListState>(
            builder: (context, state) {
              //initialing
              if (state is TodoListInitialState) {
                return const Text('Nothing to display');
              } // 
              else if (state is TodoListLoadingState) {
                return const LoadingDisplay();
              } // 
              else if (state is TodoListSuccessState) {
                return const TodoDisplay();
              } // 
              else {
                return const Text("I'm not sure what is going on");
              }
            },
          ),
        ),
      ),
    );
  }
}
