import 'package:flutter/material.dart';
import 'package:frontend/components/constants.dart';

// ignore: camel_case_types
class searchBar extends StatelessWidget {
  final String text;
  const searchBar({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
      
        decoration: InputDecoration(
          
          prefixIcon: const Icon(Icons.search ),
          border: const OutlineInputBorder(
          borderSide: BorderSide(color: kSecondaryColor)
          ),
          
          hintText: text,
          
        ),
        
      
      
      ),
    );
  }
}