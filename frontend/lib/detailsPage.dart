// import 'dart:js';

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/HomePage.dart';
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
      appBar: appbarDetail(context),

      body: Container(),
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
          icon: Image.asset(
            "/home/sinjin/ecommerce/frontend/assets/icons8-back-arrow-30.png",
            height: SizeConfig.defaultSize * 2,
          )),
    );
  }
}



