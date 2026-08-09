String? formateYear(String? date) {
  if (date == null || date.length < 4) return null;
  return date.substring(0, 4);
}