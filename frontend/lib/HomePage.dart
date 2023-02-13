// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore: file_names
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/components/constants.dart';
// import 'package:frontend/components/gridview.dart';
import 'package:frontend/components/searchbar.dart';
import 'package:frontend/components/size_config.dart';
import 'package:frontend/data/categoryAPI.dart';
import 'package:frontend/data/product.dart';
import 'package:frontend/data/productAPI.dart';
import 'package:frontend/detailsPage.dart';
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

  // Category _category = Category();
  // CategoryAPI categoryAPI = CategoryAPI();
  // Products _products = Products();

  @override
  void initState() {
    getAllProducts().then((value) {
      if (mounted) {
        setState(() {
          _productApi.addAll(value);
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
            child: Center(child: Text('Drawer Header',style: TextStyle(color: Colors.white,fontSize: 20),)),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('Page 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),])),
          backgroundColor: Color.fromARGB(255, 249, 243, 240),
          appBar: appBar(),
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
                        // searchBar(text: "Enter the product name"),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        
                        Text(
                          "Browse by category",
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
                      itemCount: _productApi.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 350,
                              crossAxisCount: 2,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  product: _productApi[index],
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
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16)),
                                        child: Image.network(
                                            _productApi[index].image.toString(),
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
                                    _productApi[index].name.toString(),
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

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.black ,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "/home/sinjin/ecommerce/frontend/assets/icons8-shopping-cart-24.png",
            height: SizeConfig.defaultSize * 2.4,
            color: Colors.white,
          ),
        )
      ],
      // leading: IconButton(
      //     onPressed: () {},
      //     icon: SvgPicture.asset(
      //       "/home/sinjin/ecommerce/frontend/assets/icons8-menu.svg",
      //       height: SizeConfig.defaultSize * 2,
      //       colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      //     )),
    );
  }
}
