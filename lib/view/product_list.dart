import 'dart:convert';

import 'package:http/http.dart' as http;
class ProductService{
  Future <List> getProductList() async{
    var uri = Uri.parse("https://fakestoreapi.com/products");
    var r = await http.get(uri);

    return  jsonDecode(r.body);

  }
}