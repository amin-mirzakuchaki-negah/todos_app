import 'package:flutter/material.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';
import 'package:todos_app/features/todo_list/presentation/bloc/todo_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/features/todo_list/presentation/screens/add_or_update_todo_screen.dart';
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

class _MainScreen extends StatefulWidget {
  const _MainScreen({super.key});

  @override
  State<_MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<_MainScreen> {
  @override
  void initState() {
    BlocProvider.of<TodoListBloc>(context).add(GetTodoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("انجام دادنی ها",
            style: TextStyle(color: Colors.greenAccent)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddTodoScreen(context);
        },
        child: const Icon(Icons.add),
      ),
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

            return TodoDisplay(
              todos: items,
              onCheckClick: _onCheckClick,
              deleteTodo: _deleteTodo,
            );
          },
        ),
      ),
    );
  }

  void _navigateToAddTodoScreen(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_context) => MultiBlocProvider(
          providers: [
            BlocProvider<TodoListBloc>.value(
              value: context.read<TodoListBloc>(),
            ),
          ],
          child:  const AddOrUpdateTodoScreen(isUpdated: false, item: null),
        ),
      ),
    );
  }

  void _navigateToUpdateTodoScreen(BuildContext context, TodoListEntity item) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_context) => MultiBlocProvider(
          providers: [
            BlocProvider<TodoListBloc>.value(
              value: context.read<TodoListBloc>(),
            ),
          ],
          child:  AddOrUpdateTodoScreen(isUpdated: true, item: item),
        ),
      ),
    );
  }

  void _onCheckClick(TodoListEntity item) {
    context.read<TodoListBloc>().add(ToggleTodoListEvent(item: item));
  }

  void _deleteTodo(TodoListEntity item) {
    context.read<TodoListBloc>().add(DeleteTodoListEvent(item: item));
  }
}
