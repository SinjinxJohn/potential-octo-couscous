import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/gridview.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Row(children: [
              Column(
                children: [
                  Text("Hello Emmanuel,", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text('What are you buying today?',style: TextStyle(fontSize: 20),)
                ],
              ),
              Spacer(),
              Container(
                child: Icon(Icons.shopping_bag),
              )
            ]),
          ),
          Text("Categories"),
          GridB()
        
          
          ],),
      )

      );
  }
}