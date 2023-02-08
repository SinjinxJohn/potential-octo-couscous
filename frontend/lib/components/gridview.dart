import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/data/category.dart';

class GridB extends StatefulWidget {
  final int length;
  const GridB({super.key,required this.length});

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  Category category1=Category();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 250,crossAxisCount: 2,crossAxisSpacing: 12.0,mainAxisSpacing: 12.0), itemBuilder: (_,idex){
        return Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(14),
            color: Color.fromARGB(255, 201, 218, 227)
          ),
          // child: ,
          // color: Colors.purpleAccent,
        );

      });
  }
}