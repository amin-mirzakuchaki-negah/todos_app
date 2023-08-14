import 'package:flutter/material.dart';

import '../../../../core/util/enum.dart';

class EnumListRow extends StatelessWidget {
  const EnumListRow({super.key});

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
          child: Text(
            formattedName[0].toUpperCase() + formattedName.substring(1),
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
