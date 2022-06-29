import 'package:api_integration/src/getx_api_call/getxHome.dart';
import 'package:api_integration/src/normal_api_call/normalApi.dart';
import 'package:api_integration/src/provider_api_call/apiProvider.dart';
import 'package:api_integration/src/provider_api_call/providerHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiProvider>(create: (_)=>ApiProvider()),
      ],
      child: MaterialApp(
        title: 'Api Integration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const NormalApi(),
        home: const ProviderHome(),
      ),
    );
  }
}

