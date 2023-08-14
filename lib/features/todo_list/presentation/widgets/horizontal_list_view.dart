import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HorizontalListView extends StatelessWidget {
  HorizontalListView({super.key});

  List<String> categories = ['item1', 'item2', 'item3'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView.builder(itemCount: categories.length, scrollDirection: Axis.horizontal ,itemBuilder: ((context, index) {
          // scrollDirection: Axis.horizontal;
          return ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.greenAccent,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(categories[index]),
          );
        })),
      ],
    );
  }
}
