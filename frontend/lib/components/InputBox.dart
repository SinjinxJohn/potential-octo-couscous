import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  TextEditingController controller;
  String value;
  bool obscure;
  InputBox({super.key,required this.controller,required this.value,required this.obscure});

  @override
  Widget build(BuildContext context) {
     return SizedBox(
        width: 350,
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration:
              InputDecoration(hintText: value, border: const OutlineInputBorder()),
        ));
  }
}