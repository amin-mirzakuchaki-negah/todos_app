import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_app/core/util/extension.dart';

import '../../../../core/util/enum.dart';
import '../bloc/todo_list_bloc.dart';
import '../widgets/input_titles.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  int _selectedIndex = -1;

  MyCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    double paddingSymmetricValue = 15;
    return BlocListener<TodoListBloc, TodoListState>(
      listener: (context, state) {
        print(state);
        if (state is AddTodoListSuccessState) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اضافه کردن انجام دادن',
              style: TextStyle(color: Colors.greenAccent)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addTodo();
          },
          child: const Icon(Icons.done),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: 50,
              left: paddingSymmetricValue,
              right: paddingSymmetricValue),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputTitle(text: 'تیتر'),
                const SizedBox(height: 10),
                TextField(
                  controller: _titleController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'تیتر اضافه کنید',
                  ),
                  minLines: 1,
                  maxLines: 1,
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SizedBox(
                          height: 45,
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_selectedIndex == index) {
                                  _selectedIndex = -1; // Deselect the button
                                } else {
                                  _selectedIndex = index; // Select the button
                                  _selectedCategory = MyCategory.values[index];
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _selectedIndex == index
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
                                color: _selectedIndex == index
                                    ? Colors.black
                                    : Colors.white,
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
    context.read<TodoListBloc>().add(AddTodoListEvent(
          title: _titleController.text,
          description: _descriptionController.text,
          category: _selectedCategory,
        ));
  }

  // MyCategory _stringToEnum({required MyCategory myCategory}) {
  //   print(myCategory);
  //   switch (myCategory) {
  //     case 'lifeStyle':
  //       return MyCategory.lifeStyle;
  //     case 'Sport':
  //       return MyCategory.sport;
  //     case 'Education':
  //       return MyCategory.education;
  //     default:
  //       throw ArgumentError('Invalid category string: $myCategory');
  //   }
  // }
}
