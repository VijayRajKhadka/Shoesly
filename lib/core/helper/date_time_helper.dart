class DateTimeHelper {
  static String timeAgo(String dateTimeString) {
    DateTime createdAt = DateTime.parse(dateTimeString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(createdAt);

    return _formatTime(difference, isPast: true);
  }

  static String timeAfter(String dateTimeString) {
    DateTime createdAt = DateTime.parse(dateTimeString);
    DateTime now = DateTime.now();
    Duration difference = createdAt.difference(now);

    return _formatTime(difference, isPast: false);
  }

  static String _formatTime(Duration difference, {required bool isPast}) {
    int years = (difference.inDays / 365).floor();
    int months = (difference.inDays / 30).floor();
    int weeks = (difference.inDays / 7).floor();

    switch (true) {
      case var _ when difference.inDays > 365:
        return _formatString(years, "year", isPast);
      case var _ when difference.inDays >= 30:
        return _formatString(months, "month", isPast);
      case var _ when difference.inDays >= 7:
        return _formatString(weeks, "week", isPast);
      case var _ when difference.inDays >= 1:
        return _formatString(difference.inDays, "day", isPast);
      case var _ when difference.inHours >= 1:
        return _formatString(difference.inHours, "hour", isPast);
      case var _ when difference.inMinutes >= 1:
        return _formatString(difference.inMinutes, "minute", isPast);
      default:
        return isPast ? 'just now' : 'soon';
    }
  }

  static String _formatString(int value, String unit, bool isPast) {
    String suffix = isPast ? ' ago' : ' later';
    return '$value $unit${value == 1 ? '' : 's'}$suffix';
  }
}
