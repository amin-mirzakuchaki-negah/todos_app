import 'package:shamsi_date/shamsi_date.dart';
import 'package:todos_app/core/util/enum.dart';
import 'package:todos_app/features/todo_list/domain/entities/todo_list_entity.dart';

extension StringExt on String {
  MyCategory? get toCategory {
    switch (this) {
      case 'LIFE_STYLE':
        return MyCategory.lifeStyle;
      case 'SPORT':
        return MyCategory.sport;
      case 'EDUCATION':
        return MyCategory.education;
    }
    return null;
  }

  String? get toFarsiString {
    switch (this) {
      case 'MyCategory.sport':
        return 'ورزشی';
      case 'MyCategory.lifeStyle':
        return 'سبک زندگی';
      case 'MyCategory.education':
        return 'تحصیلی';
    }
    return null;
  }

  Jalali? get toJalali {
    final date = DateTime.tryParse(this);
    if (date == null) return null;
    final jalali = Jalali.fromDateTime(date);
    return jalali.copy(
      hour: date.hour,
      minute: date.minute,
      second: date.second,
      millisecond: date.microsecond,
    );
  }
}

extension CategoryExt on MyCategory {
  String get toValue {
    switch (this) {
      case MyCategory.lifeStyle:
        return 'LIFE_STYLE';
      case MyCategory.sport:
        return 'SPORT';
      case MyCategory.education:
        return 'EDUCATION';
    }
  }

  String get toStringValue {
    switch (this) {
      case MyCategory.lifeStyle:
        return 'سبک زندگی';
      case MyCategory.sport:
        return 'ورزشی';
      case MyCategory.education:
        return 'تحصیلی';
    }
  }
}

extension JalaliExt on Jalali {
  String get toValue {
    return toDateTime().toString();
  }
}

extension TodoListEntityExt on TodoListEntity {
  List<dynamic> toList() {
    return [title, description, id, done, createdAt, updatedAt, category];
  }
}
