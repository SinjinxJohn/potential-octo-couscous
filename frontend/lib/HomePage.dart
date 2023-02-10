// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
// import 'package:frontend/components/gridview.dart';
import 'package:frontend/components/searchbar.dart';

import 'data/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   Category _category =  Category();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hello Emmanuel,",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'What are you buying today?',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(Icons.shopping_bag)
              ]),
              const SizedBox(
                height: 40,
              ),
              const searchBar(text: "Search Products"),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Trending Sales",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<List>(
                future: _category.getAllCategories(),
                builder: (context, snapshot) {
                  print(snapshot);
                  if (snapshot.hasData) {
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 300,
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 12.0),
                        itemBuilder: (_, index) {
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(14),
                                color: Color.fromARGB(255, 240, 242, 243)),

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                                              
                                    "${snapshot.data?.elementAt(index)['image']}",
                                    height: 200,
                                  
                                  ),
                                )
                              ],
                            ),
                            // color: Colors.purpleAccent,
                          );
                        });
                  } else {
                    return const Text('Data not loading');
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
