// import 'dart:js';

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/HomePage.dart';
import 'package:frontend/cart.dart';
import 'package:frontend/components/cartController.dart';
import 'package:frontend/components/constants.dart';
import 'package:frontend/data/category.dart';
import 'package:frontend/data/categoryAPI.dart';
import 'package:frontend/data/productAPI.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'components/size_config.dart';
// import 'package:frontend/HomePage.dart';

class DetailsPage extends StatelessWidget {
  final ProductApi product;
  final cartcontroller = Get.put(CartController());
  DetailsPage({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 243, 240),
      appBar: appbarDetail(context),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image.toString(),
            fit: BoxFit.cover,
            width: double.infinity,
            height: 400,
            ),
            SizedBox(
              height: SizeConfig.defaultSize*2,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text(product.name.toString(),style: TextStyle(fontSize: SizeConfig.defaultSize*1.6,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 81, 80, 80)),),
                ),
                Spacer(),
                 Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10),
              child: Text("\$${product.price}",style: TextStyle(fontSize: SizeConfig.defaultSize*1.6,fontWeight: FontWeight.bold,),
            ),)
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize*1.6,),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right:10),
              child: Text(product.desc.toString(),style: TextStyle(fontSize: SizeConfig.defaultSize*1.3,color: kTextColor),),
            ),
            // SizedBox(height: SizeConfig.defaultSize*1,),
           
            SizedBox(height: SizeConfig.defaultSize*14,),
            // Spacer(),
            Center(
              child: GestureDetector(
                onTap: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
                    height: 35,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: Text("Item has been added to cart",style: TextStyle(color: Colors.white,),)
                  )));
                  cartcontroller.addProduct(product);
                },
                child: Container(
                  height:SizeConfig.defaultSize*5 ,
                  width: SizeConfig.defaultSize*24,
                  decoration: BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30),
                    child: Center(child:
                     Text("ADD TO CART",style: TextStyle(fontSize: SizeConfig.defaultSize*1.3,fontWeight: FontWeight.bold),)
                    
                     ),
                  ),
                ),
              ),
            )
            
        
          ],
        ),
      ),
    );
  }

  AppBar appbarDetail(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
          },
          icon: Image.asset(
            "/home/sinjin/ecommerce/frontend/assets/icons8-shopping-cart-24.png",
            height: SizeConfig.screenHeight* 0.5,
            color: Colors.white,
            
          ),
        )
      ],
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            "/home/sinjin/ecommerce/frontend/assets/back-arrow-direction-down-right-left-up-2-svgrepo-com.svg",
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: SizeConfig.defaultSize * 2,
          )),
    );
  }
}



