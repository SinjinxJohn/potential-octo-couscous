import 'package:flutter/material.dart';

// ignore: camel_case_types
class searchBar extends StatelessWidget {
  final String text;
  const searchBar({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 15,left: 20,right: 20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search ),
          border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
          ),
          
          hintText: text,
          
        ),
        
    
    
      ),
    );
  }
}