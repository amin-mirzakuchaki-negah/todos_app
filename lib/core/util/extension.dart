import 'package:shamsi_date/shamsi_date.dart';
import 'package:todos_app/core/util/enum.dart';

extension StringExt on String {
  Category? get toCategory {
    switch (this) {
      case 'LIFE_STYLE':
        return Category.lifStyle;
      case 'SPORT':
        return Category.sport;
      case 'EDUCATION':
        return Category.education;
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