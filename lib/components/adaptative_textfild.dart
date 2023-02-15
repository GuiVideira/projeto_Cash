import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class AdaptativeTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final String label;

  const AdaptativeTextFiled({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CupertinoTextField(
                controller: controller,
                keyboardType: keyboardType,
                onSubmitted: onSubmitted,
                placeholder: label,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 12,
                )),
          )
        : Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                labelText: label,
              )),
        );
  }
}
