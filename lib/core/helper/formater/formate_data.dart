const _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

String formatDate(String date) {
  try {
    final parsed = DateTime.parse(date);
    return '${_months[parsed.month - 1]} ${parsed.day}, ${parsed.year}';
  } catch (_) {
    return date;
  }
}