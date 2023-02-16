import 'package:frontend/data/productAPI.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  //create a dictionary 
  var products={}.obs;

  void addProduct(ProductApi product){
    if(products.containsKey(product)){
      products[product]+=1;
    }else{
      products[product]=1;
    }

    // Get.snackbar("Product added", "Your product ${product.name} has been added",
    // snackPosition: SnackPosition.BOTTOM,
    // duration: const Duration(seconds: 2)
    // );
    
  }

  get productsCart =>products;

  void removeProduct(ProductApi product){
    if(products.containsKey(product)&&products[product]==1){
      products.removeWhere((key, value) => key==product);
    }else{
      products[product] -=1;
    }


  }
  get productTotal => products.entries.map((product) => product.key.price*product.value).toList();
  get Total=>products.entries.map((product) => product.key.price*product.value).toList().reduce((value, element) => value+element).toStringAsFixed(2);
}