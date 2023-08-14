import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingSymmetricValue = 15;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Add todo', style: TextStyle(color: Colors.greenAccent)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.greenAccent),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: 50, left: paddingSymmetricValue, right: paddingSymmetricValue),
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                Text('Title', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a title',
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                Text('Description', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              minLines: 10, // Adjust the number of lines as needed
              maxLines: 20,
            ),
          ],
        ),
      ),
    );
  }
}
