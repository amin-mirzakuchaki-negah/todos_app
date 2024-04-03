import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/core/util/extension.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/failure_dialog.dart';

import '../../../../core/util/enum.dart';
import '../../domain/entities/todo_list_entity.dart';
import '../bloc/todo_list_bloc.dart';
import '../widgets/input_titles.dart';

class AddOrUpdateTodoScreen extends StatefulWidget {
  const AddOrUpdateTodoScreen({
    super.key,
    this.item,
  });

  final TodoListEntity? item;

  @override
  State<AddOrUpdateTodoScreen> createState() => _AddOrUpdateTodoScreenState();
}

class _AddOrUpdateTodoScreenState extends State<AddOrUpdateTodoScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  // int _selectedIndex = -1;

  MyCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.item?.title ?? '';
    _descriptionController.text = widget.item?.description ?? '';
    _selectedCategory = widget.item?.category;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double paddingSymmetricValue = 15;
    return BlocListener<TodoListBloc, TodoListState>(
      listener: (context, state) {
        if (state is AddTodoListSuccessState) Navigator.of(context).pop();
        if (state is UpdateTodoListSuccessState) Navigator.of(context).pop();
        if (state.isFailure) {
          _showFailureDialog(context, _isUpdate);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _isUpdate
                ? "بروز کردن ${widget.item!.title}"
                : 'اضافه کردن انجام دادنی ها',
            style: const TextStyle(color: Colors.greenAccent),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white70,
          backgroundColor: Colors.greenAccent.shade400,
          onPressed: () {
            if (_isUpdate) {
              _updateTodo();
              return;
            }
            _addTodo();
          },
          child: Icon(_isUpdate ? Icons.update : Icons.done),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 50,
            left: paddingSymmetricValue,
            right: paddingSymmetricValue,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputTitle(text: 'تیتر'),
                const SizedBox(height: 10),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'تیتر اضافه کنید',
                  ),
                ),
                const SizedBox(height: 35),
                InputTitle(text: 'توضیحات'),
                const SizedBox(height: 10),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'توضیحات اضافه کنید',
                  ),
                  minLines: 8,
                  maxLines: 8,
                ),
                const SizedBox(height: 10),
                InputTitle(text: 'دسته بندی ها'),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: MyCategory.values.length,
                    itemBuilder: (BuildContext context, int index) {
                      final isSelected =
                          _selectedCategory == MyCategory.values[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 45,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isSelected) return;
                              setState(() {
                                _selectedCategory = MyCategory.values[index];
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? Colors.white
                                  : Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.greenAccent,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Text(
                              MyCategory.values[index].toStringValue,
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addTodo() {
    context.read<TodoListBloc>().add(
          AddTodoListEvent(
            title: _titleController.text,
            description: _descriptionController.text,
            category: _selectedCategory,
          ),
        );
  }

  void _updateTodo() {
    final item = widget.item;
    if (item == null) return;
    context.read<TodoListBloc>().add(
          UpdateTodoListEvent(
            title: _titleController.text,
            description: _descriptionController.text,
            category: _selectedCategory,
            item: item,
          ),
        );
  }

  void _showFailureDialog(BuildContext context, bool isUpdated) async {
    await showDialog(
        context: context,
        builder: (context) => FailureDialog(
              onTapped: () {
                Navigator.of(context).pop();
              },
              isUpdated: isUpdated,
            ));
    if (!mounted) return;
    context.read<TodoListBloc>().add(InitialTodoListEvent());
  }

  bool get _isUpdate => widget.item != null;
}
