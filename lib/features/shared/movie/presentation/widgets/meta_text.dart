import 'package:flutter/material.dart';

Widget buildMetaText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      color: Colors.white.withValues(alpha: 0.6),
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
  );
}
