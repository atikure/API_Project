
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService{
  Future <List> getBookList() async{
    var uri = Uri.parse("https://fakeapi.extendsclass.com/books");
    // var uri = Uri.parse("https://fakeapi.extendsclass.com/books");
    var r = await http.get(uri);
    return  jsonDecode(r.body);
  }
}