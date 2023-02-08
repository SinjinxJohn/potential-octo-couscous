import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class searchBar extends StatelessWidget {
  final String text;
  const searchBar({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0,bottom: 15,left: 30,right: 30),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search ),
            border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
            ),
            
            hintText: text,
            
          ),
          
    
    
        ),
      ),
    );
  }
}