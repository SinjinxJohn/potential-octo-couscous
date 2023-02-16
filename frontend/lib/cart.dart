import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/components/cartController.dart';
import 'package:frontend/data/productAPI.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'components/size_config.dart';

class CartPage extends StatefulWidget {
  
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
         SizedBox(
          height: 600,
          child: ListView.builder(
            itemCount: controller.productsCart.length,
            itemBuilder:  (context, index){
              return CartProductCard(
                controller: controller,
                productApi: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }) 
        ));
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
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: SizeConfig.defaultSize * 2,
          )),
    );
  }

  
}
class CartProductCard extends StatelessWidget{
  final CartController controller;
  final ProductApi productApi;
  final int quantity;
  final int index;
  const CartProductCard({super.key,required this.controller,required this.productApi,required this.quantity,required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return 
       Padding(
         padding: const EdgeInsets.only(top:15.0,bottom: 10,left: 15),
         child: Row(children: [
          CircleAvatar(radius: 40,backgroundImage: NetworkImage(productApi.image.toString()),),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(productApi.name.toString(),style: TextStyle(fontWeight: FontWeight.bold),)),
          IconButton(onPressed: (){
            controller.removeProduct(productApi);
          }, icon: Icon(Icons.remove_circle)),
          Text("${quantity}"),
          IconButton(onPressed: (){
            controller.addProduct(productApi);
          }, icon: Icon(Icons.add_circle)),

          // Image.network(productApi.image.toString())
             ],
           ),
       );
  }

    
  }