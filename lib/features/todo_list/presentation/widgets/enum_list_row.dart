import 'package:flutter/material.dart';

import '../../../../core/util/enum.dart';

class EnumListRow extends StatefulWidget {
  EnumListRow({super.key});

  @override
  State<EnumListRow> createState() => _EnumListRowState();
}

class _EnumListRowState extends State<EnumListRow> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    enumToStringList() {
      return MyCategory.values.map((category) {
        String formattedName = category.toString().split('.').last;
        formattedName =
            formattedName.replaceAllMapped(RegExp(r'([A-Z])'), (match) {
          return ' ${match.group(1)}';
        }).trim();
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 120,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: isTapped ? Colors.grey : Colors.transparent,
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
                  formattedName[0].toUpperCase() + formattedName.substring(1)),
            ),
          ),
        );
      }).toList();
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: enumToStringList(),
      ),
    );
  }
}
