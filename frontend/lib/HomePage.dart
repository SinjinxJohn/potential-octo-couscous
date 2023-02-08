import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/components/gridview.dart';
import 'package:frontend/components/searchbar.dart';
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
        child: Padding(
padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              child: Row(children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 40,),
            searchBar(text: "Search Products"),
            SizedBox(height: 15,),
            Text("Trending Sales",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),

            SizedBox(height: 20,),
            GridB()
          
            
            ],),
        ),
      )

      );
  }
}