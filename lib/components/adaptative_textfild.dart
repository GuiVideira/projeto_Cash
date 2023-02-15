import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class adaptativeTextFiled extends StatelessWidget {
  
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmitted;
  final String label;
  
  const adaptativeTextFiled({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.onSubmitted,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? CupertinoTextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      placeholder: label,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical:12,
      )
    ) 
    : TextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                labelText: label,
              )
    );
  }
}