

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier{

  List getList = [];
  bool loading = false;


  getUsingProduct() async {

    loading = true;
    var url2= 'https://fakestoreapi.com/products';

    var response = await http.get(Uri.parse(url2));
    if(response.statusCode == 200){
      getList = json.decode(response.body);
      loading = false;
    }
    else{
      throw Exception('Invalid Url');
    }
    notifyListeners();


  }


}