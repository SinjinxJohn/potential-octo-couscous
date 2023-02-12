import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:frontend/data/categoryAPI.dart';
import 'package:http/http.dart' as http;

List<CategoryAPI> parsePost(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  var posts  = list.map((model)=>CategoryAPI.fromJson(model)).toList();
  return posts;
  }

  // String baseUrl="http://127.0.0.1:8000/api/categories/";
  Future<List<CategoryAPI>> getAllCCategories() async{
    
      final response = await http.get(Uri.parse("http://127.0.0.1:8000/api/categories/"));
      // var data = jsonDecode(response.body.toString());
      if(response.statusCode==200){
        // return jsonDecode(response.body);
        return compute(parsePost,response.body);
      }else{
        throw Exception("Request api error");
      }
  }


