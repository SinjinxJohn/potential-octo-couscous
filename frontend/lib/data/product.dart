import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/data/productAPI.dart';
import 'package:http/http.dart' as http;
// class Products{
//   String baseUrl="http://127.0.0.1:8000/api/products/";
//   Future<List> getAllProducts() async{
//     try{
//       var response = await http.get(Uri.parse(baseUrl));
//       if(response.statusCode==200){
//         return jsonDecode(response.body);
//       }else{
//         return Future.error("Server Error");
//       }

//     }catch(e){
//       return Future.error(e);
//     }
//   }


// }
List<ProductApi> parsePost(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var posts  = list.map((model)=>ProductApi.fromJson(model)).toList();
  return posts;
  }

  // String baseUrl="http://127.0.0.1:8000/api/categories/";
  Future<List<ProductApi>> getAllProducts() async{
    
      final response = await http.get(Uri.parse("http://127.0.0.1:8000/api/products/"));
      // var data = jsonDecode(response.body.toString());
      if(response.statusCode==200){
        // return jsonDecode(response.body);
        return compute(parsePost,response.body);
      }else{
        throw Exception("Request api error");
      }
  }