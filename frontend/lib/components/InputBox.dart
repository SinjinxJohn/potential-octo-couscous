import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  TextEditingController controller;
  String value;
  bool obscure;
  InputBox({super.key,required this.controller,required this.value,required this.obscure});

  @override
  Widget build(BuildContext context) {
     return Container(
        width: 350,
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration:
              InputDecoration(hintText: value, border: OutlineInputBorder()),
        ));;
  }
}