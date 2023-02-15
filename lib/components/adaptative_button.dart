import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function pressed;

  const AdaptativeButton({
    super.key,
    required this.label,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            onPressed: pressed(),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label))
        : ElevatedButton(
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: ()=> pressed(),
            child: Text(label),
          );
  }
}
