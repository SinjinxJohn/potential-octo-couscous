import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';

import 'components/size_config.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCart(context),
    );
  }

   AppBar appbarCart(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
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