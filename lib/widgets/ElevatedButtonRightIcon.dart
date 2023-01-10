import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElevatedButtonRightIcon extends StatelessWidget {
  final Widget icon;
  final Widget label;
  final void Function()? onPressed;

  const ElevatedButtonRightIcon({Key? key, required this.icon, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          label,
          const SizedBox(width: 10,),
          icon
        ],
      ),
    );
  }
}
