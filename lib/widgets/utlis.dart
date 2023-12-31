import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month,item*7),
    value: (item) => List.generate(
        item % 5 + 1, (index) => Event('Lesson ${index + 1}:\nStart:${item+index}:00\nEnd:${item+index+1}:00\nOwner:')))
  ..addAll({
    kToday: [
      const Event('Lesson 1:\nStart:7:00\nKết thúc:8:00\nOwner:Do Manh Cuong')
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}
final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month ,kToday.day);
final kLastDay = DateTime(2050, kToday.month + 3, kToday.day);