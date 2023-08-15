import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoCards extends StatefulWidget {
  TodoCards({
    super.key,
    required this.title,
    required this.description,
    required this.category,
  });

  String title;
  String description;
  String category;

  @override
  State<TodoCards> createState() => _TodoCardsState();
}

class _TodoCardsState extends State<TodoCards> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        // color: Colors.grey[800],
        height: 80,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //first line
                Row(
                  children: [
                    Checkbox(activeColor: Colors.blue ,value: isChecked, onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                    const SizedBox(width: 20),
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Text(
                      widget.category,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      widget.description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
