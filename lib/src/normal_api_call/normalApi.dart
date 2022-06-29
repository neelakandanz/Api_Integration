import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class NormalApi extends StatefulWidget {
  const NormalApi({Key? key}) : super(key: key);

  @override
  State<NormalApi> createState() => _NormalApiState();
}

class _NormalApiState extends State<NormalApi> {

  List product= [];


  getProduct()async{
    String url1 ='https://fakestoreapi.com/products';

    var response = await http.get(Uri.parse(url1));
    if(response.statusCode == 200){
      setState((){
        product = json.decode(response.body);
      });
    }
  }

  @override
  void initState(){
    // getProduct();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Normal Api'),
        actions: [
          IconButton(onPressed: (){
            getProduct();
          }, icon: const Icon(Icons.search))
        ],
      ),
      body: SizedBox(
        height: 600,
        width: 400,
       // color: Colors.amberAccent,
        child: ListView.builder(
          itemCount: product.length,
            itemBuilder: (ctx,i){
            return ListTile(
              title: Text(product[i]["title"]),
              subtitle: Text(product[i]["price"].toString()),
            );
            }),
      ),
    );
  }
}
