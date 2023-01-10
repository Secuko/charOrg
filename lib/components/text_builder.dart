import 'package:flutter/widgets.dart';
import 'package:vol_org/styles/styles.dart';

Widget pairTextBuilder(String title, String text) {
  return Row(
    children: [
      Text(
        title,
        style: styles.mainTextTheme.bodyMedium
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(text),
    ],
  );
}