import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GridB extends StatefulWidget {
  const GridB({super.key});

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 250,crossAxisCount: 2,crossAxisSpacing: 12.0,mainAxisSpacing: 12.0), itemBuilder: (_,idex){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.purpleAccent
          ),
          // color: Colors.purpleAccent,
        );

      });
  }
}