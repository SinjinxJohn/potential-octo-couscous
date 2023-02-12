// import 'dart:js';

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/HomePage.dart';
import 'package:frontend/components/constants.dart';
import 'package:frontend/data/category.dart';
import 'package:frontend/data/categoryAPI.dart';
import 'package:frontend/data/productAPI.dart';

import 'components/size_config.dart';
// import 'package:frontend/HomePage.dart';

class DetailsPage extends StatelessWidget {
  final ProductApi product;
  const DetailsPage({super.key, required this.product});

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
                  padding: const EdgeInsets.only(left:8),
                  child: Text(product.name!.toUpperCase().toString(),style: TextStyle(fontSize: SizeConfig.defaultSize*1.6,fontWeight: FontWeight.bold),),
                ),
                Spacer(),
                 Padding(
              padding: const EdgeInsets.only(left:8.0,right: 8),
              child: Text("\$"+product.price.toString(),style: TextStyle(fontSize: SizeConfig.defaultSize*1.6,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 81, 80, 80)),),
            ),
              ],
            ),
            SizedBox(height: SizeConfig.defaultSize*1.6,),
            Padding(
              padding: const EdgeInsets.only(left:8.0,right:8),
              child: Text(product.desc.toString(),style: TextStyle(fontSize: SizeConfig.defaultSize*1.3,color: kTextColor),),
            ),
            // SizedBox(height: SizeConfig.defaultSize*1,),
           
            SizedBox(height: SizeConfig.defaultSize*7,),
            // Spacer(),
            Center(
              child: Container(
                height:SizeConfig.defaultSize*5 ,
                width: SizeConfig.screenWidth*0.8,
                decoration: BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.only(left:30.0, right: 30),
                  child: Center(child: Text("ADD TO CART",style: TextStyle(fontSize: SizeConfig.defaultSize*1.3,fontWeight: FontWeight.bold),)),
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "/home/sinjin/ecommerce/frontend/assets/icons8-shopping-cart-24.png",
            height: SizeConfig.screenHeight* 0.5,
            
          ),
        )
      ],
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            "/home/sinjin/ecommerce/frontend/assets/back-arrow-direction-down-right-left-up-2-svgrepo-com.svg",
            height: SizeConfig.defaultSize * 2,
          )),
    );
  }
}



