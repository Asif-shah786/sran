class TimerSessionData {
  final String duration;
  final String dateTime;

  TimerSessionData(
      {
      required this.duration,
      required this.dateTime,
      });

  static Map<String, dynamic> toMap(TimerSessionData model) => {
        'duration': model.duration,
        'date': model.dateTime,
      };
  static TimerSessionData fromMap(Map map) => TimerSessionData(
    duration: map['duration'],
    dateTime: map['date'],
      );
}


extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month
        && day == other.day;
  }
}