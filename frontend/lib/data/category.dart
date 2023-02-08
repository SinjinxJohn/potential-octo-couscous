import 'dart:convert';

import 'package:http/http.dart' as http;
class Category{
  String baseUrl="http://127.0.0.1:8000/api/categories/";
  Future<List> getAllCategories() async{
    try{
      var response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode==200){
        return jsonDecode(response.body);
      }else{
        return Future.error("Server error");
      }

    }catch(e){
      return Future.error(e);
    }
  }


}