import 'package:shamsi_date/shamsi_date.dart';
import 'package:todos_app/core/util/enum.dart';

extension StringExt on String {
  MyCategory? get toCategory {
    switch (this) {
      case 'LIFE_STYLE':
        return MyCategory.lifStyle;
      case 'SPORT':
        return MyCategory.sport;
      case 'EDUCATION':
        return MyCategory.education;
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
      case MyCategory.lifStyle:
        return 'LIFE_STYLE';
      case MyCategory.sport:
        return 'SPORT';
      case MyCategory.education:
        return 'EDUCATION';
    }
  }
}


extension JalaliExt on Jalali {
  String get toValue {
    return toDateTime().toString();
  }
}
