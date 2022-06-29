import 'package:api_integration/src/provider_api_call/apiProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProviderHome extends StatefulWidget {
  const ProviderHome({Key? key}) : super(key: key);

  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {

  @override
  void initState(){

     final getData = Provider.of<ApiProvider>(context,listen: false);
    getData.getUsingProduct();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<ApiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Api Integration'),
      ),
      body: SizedBox(
        height: 600,
        width: 400,
       //  color: Colors.black,
        child: getData.loading
          ?
            const Center(child: CircularProgressIndicator(),)
            :
        ListView.builder(
            itemCount: getData.getList.length,
            itemBuilder: (ctx,i){
              return ListTile(
                title: Text(getData.getList[i]['title']),
                subtitle: Text(getData.getList[i]["price"].toString()),
              );
            }),
      ),
    );
  }
}
