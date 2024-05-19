import 'package:intl/intl.dart';

/// Extensions for [DateTime] class.
extension DateTimeExtensions on DateTime {
  /// Converts the date to a custom format for the trip date
  String get toCustomTripDate {
    final now = DateTime.now();
    final formatter = DateFormat('dd MMM'); // Format without the year
    final formatterWithYear =
        DateFormat('dd MMM, yyyy'); // Format with the year

    // Check if the date is within the current year
    if (year == now.year) {
      return formatter.format(this);
    } else {
      return formatterWithYear.format(this);
    }
  }

  /// Converts the date to a custom format for the trip time
  String get toMessagesDateTime {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    // Check if the date is today or yesterday or another day
    if (year == today.year && month == today.month && day == today.day) {
      return DateFormat('h:mm a').format(this); // e.g., 1:02 PM
    } else if (year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day) {
      // e.g., Yesterday at 1:02 PM
      return 'Yesterday at ${DateFormat('h:mm a').format(this)}';
    } else {
      return DateFormat('d MMM').format(this); // e.g., 22 Jan
    }
  }
}
