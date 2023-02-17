import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return Obx(
      () => Container(
        child: Container(
          height: 150,
          width: 480,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0,top: 15),
                    child: Text(
                      "Subtotal:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0,top: 15),
                    child: Text(
                      "\$${_controller.Total}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // IconButton(onPressed: (){}, icon: i)
                ],
              ),
              SizedBox(height: 30,),
              TextButton(onPressed: () {}, child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(child: Text("Check Out",style: TextStyle(color: Colors.white),))))
            ],
          ),
        ),
      ),
    );
  }
}
