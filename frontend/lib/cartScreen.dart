import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/cart.dart';
import 'package:frontend/cartTotal.dart';
import 'package:frontend/components/constants.dart';

import 'components/size_config.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 233, 232, 232),
      appBar:appbarCart(context) ,
      body: SizedBox(
        height: 800,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CartPage(),
              CartTotal()
            ],
          ),
        ),
      ),
    );
  }
  AppBar appbarCart(BuildContext context) {
    return AppBar(
      title: Center(child: Text("Cart Items",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
      backgroundColor: Colors.black,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset(
            "/home/sinjin/ecommerce/frontend/assets/back-arrow-direction-down-right-left-up-2-svgrepo-com.svg",
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: SizeConfig.defaultSize * 2,
          )),
    );
  }
}