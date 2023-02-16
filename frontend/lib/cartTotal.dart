import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:frontend/components/cartController.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartTotal extends StatelessWidget {
  final CartController _controller = Get.find();
  CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75,),
          child: Row(
            children: [
              Text("Total", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right:30.0),
                child: Text("\$${_controller.Total}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
    
      ),
    );
  }
}