import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/components/gridview.dart';
import 'package:frontend/components/searchbar.dart';

import 'data/category.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Category category = Category();
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
            Container(
              child: FutureBuilder<List>(future: category.getAllCategories(),builder: (context,snapshot){
                // print(snapshot.data);
                if(snapshot.hasData){
                  return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data!.length,
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 300,crossAxisCount: 2,crossAxisSpacing: 12.0,mainAxisSpacing: 12.0), itemBuilder: (_,index){
        return Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(14),
            color: Color.fromARGB(255, 201, 218, 227)
          ),

          child: Column(
            children: [
              Image.network("${snapshot.data?.elementAt(index)['image']}",height: 200,)
            ],
          ),
          // color: Colors.purpleAccent,
        );

      });;
                }else{
                  return Text('No data found');
                }
              }, ),
            )
          
            
            ],),
        ),
      )

      );
  }
}