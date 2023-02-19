// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/cart.dart';
import 'package:frontend/cartScreen.dart';
import 'package:frontend/components/constants.dart';
// import 'package:frontend/components/gridview.dart';
import 'package:frontend/components/searchbar.dart';
import 'package:frontend/components/size_config.dart';
import 'package:frontend/data/categoryAPI.dart';
import 'package:frontend/data/product.dart';
import 'package:frontend/data/productAPI.dart';
import 'package:frontend/detailsPage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:frontend/data/category.dart';

import 'data/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductApi> _productApi = [];
  List<ProductApi> _found = [];

  void updateList(String value){
    value = value.toLowerCase();
                                  setState(() {
                                    _found=_productApi.where((element){
                                      var productname = element.name!.toLowerCase();
                                      return productname.contains(value);

                                    }).toList();
                                  });
  }

  // Category _category = Category();
  // CategoryAPI categoryAPI = CategoryAPI();
  // Products _products = Products();

  @override
  void initState() {
    getAllProducts().then((value) {
      if (mounted) {
        setState(() {
          _productApi.addAll(value);
          _found=_productApi;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
              child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                      child: Text(
                    'Drawer Header',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
                ListTile(
                  leading: Image.asset(
                    "/home/sinjin/ecommerce/frontend/assets/icons8-shopping-cart-24.png",
                    height: SizeConfig.defaultSize * 2.4,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Cart",
                    style: TextStyle(fontSize: SizeConfig.defaultSize * 1.2),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => CartScreen())));
                    // Get.to(()=>CartPage());
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.album_outlined,
                    color: Colors.black,
                  ),
                  title: const Text('About Page'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ])),
          backgroundColor: Color.fromARGB(255, 249, 243, 240),
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => CartScreen())));
                },
                icon: Image.asset(
                  "/home/sinjin/ecommerce/frontend/assets/icons8-shopping-cart-24.png",
                  height: SizeConfig.defaultSize * 2.4,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.defaultSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome back, Emanuel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.defaultSize * 1.6)),
                        SizedBox(
                          height: SizeConfig.defaultSize * 0.5,
                        ),
                        SizedBox(
                            height: 100,
                            width: SizeConfig.screenWidth * 0.9,
                            child: Center(
                              child: TextField(
                                onChanged: (value)=>updateList(value),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kSecondaryColor)),
                                  hintText: "search product",
                                ),
                              ),
                            )),
                        // Text('What are you buying today?',
                        // style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: SizeConfig.defaultSize * 1.6)),
                        // searchBar(text: "Enter the product name"),
                        // SizedBox(
                        //   height: 20,
                        // ),

                        Text(
                          "Top Products",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: SizeConfig.defaultSize * 1.6),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: SizeConfig.defaultSize * 2,
                  ),
                  // FutureBuilder<List>(
                  //   future: _category.getAllCategories(),
                  //   builder: (context, snapshot) {
                  //     // print(snapshot);
                  //     if (snapshot.hasData) {
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _found.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 350,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0),
                      itemBuilder: (_, index) {
                        return _listItems(context, index);
                      }),

                  //     else {
                  //       return Lottie.network('https://assets4.lottiefiles.com/datafiles/QeC7XD39x4C1CIj/data.json');
                  //     }
                  //   },
                  // ),

                  // const searchBar(text: "Search Products"),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  SizedBox(
                    height: SizeConfig.defaultSize * 2,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  GestureDetector _listItems(BuildContext context, int index) {
    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                product: _found[index],
                              ),
                            )),
                        child: Container(
                          height: SizeConfig.defaultSize * 5,
                          width: SizeConfig.defaultSize * 5,
                          decoration: BoxDecoration(

                              // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5),spreadRadius: 2,blurRadius: 1)],
                              // s
                              borderRadius: BorderRadius.circular(14),
                              color: Color.fromARGB(255, 233, 232, 232)),

                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: SizeConfig.defaultSize * 1.6),
                                  child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16)),
                                      child: Image.network(
                                          _found[index].image.toString(),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 260, loadingBuilder:
                                              (context, child,
                                                  loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;

                                        return Center(
                                            child: Lottie.asset(
                                                "/home/sinjin/ecommerce/frontend/assets/79609-loading-button.json"));
                                      }
                                          // height: SizeConfig.screenHeight*0.27,
                                          // width: SizeConfig.screenWidth*0.9,
                                          )),
                                ),
                                // SizedBox(height: SizeConfig.defaultSize*0.1),
                                Text(
                                  _found[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: SizeConfig.defaultSize * 1.1,
                                      color: kTextColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          // color: Colors.purpleAccent,
                        ),
                      );
  }
}
