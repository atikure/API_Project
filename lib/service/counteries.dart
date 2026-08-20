import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer';


class CountriesService{
  getCountries()async{ //fake api
    var url = Uri.parse("https://fakeapi.extendsclass.com/countries");
    var reponse = await http.get(url);
    if(reponse.statusCode == 200){
      return jsonDecode(reponse.body);
    }
  }
}