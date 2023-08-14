import 'package:flutter/material.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/enum_list_row.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/horizontal_list_view.dart';
import 'package:todos_app/features/todo_list/presentation/widgets/input_titles.dart';

import '../../../../core/util/enum.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  List<String> categories = ['item1', 'item2', 'item3'];

  bool isTapped = false;

  int selectedIndex = -1;

  
  @override
  Widget build(BuildContext context) {
    double paddingSymmetricValue = 15;
List<String> myCategories = enumToList();
    return Scaffold(
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
            addTodo();
          },
          child: Icon(Icons.done)),
      body: Padding(
        padding: EdgeInsets.only(
            top: 50, left: paddingSymmetricValue, right: paddingSymmetricValue),
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
              minLines: 9,
              maxLines: 9,
            ),
            const SizedBox(height: 10),
            InputTitle(text: 'دسته بندی ها'),
            const SizedBox(height: 10),
            Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: myCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      height: 45,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (selectedIndex == index) {
                              selectedIndex = -1; // Deselect the button
                            } else {
                              selectedIndex = index; // Select the button
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedIndex == index
                              ? Colors.grey
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
                          myCategories[index],
                          style: TextStyle(
                            color: selectedIndex == index
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
    );
  }

  addTodo() {}

  List<String> enumToList() {
    return MyCategory.values.map((category) {
    String categoryString = category.toString().split('.').last;
    return categoryString[0].toUpperCase() + categoryString.substring(1).toLowerCase().replaceAll('_', ' ');
  }).toList();
  }
}
