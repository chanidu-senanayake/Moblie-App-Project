import 'dart:io';

import 'package:final_project/StoresPage/bike/bikehome.dart';
import 'package:final_project/StoresPage/customers/cushome.dart';

import 'package:final_project/StoresPage/heavy%20vehical/heavyhome.dart';
import 'package:final_project/StoresPage/ligh%20vehical/lighhome.dart';
import 'package:final_project/login_page.dart';
import 'package:final_project/store_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //for web
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD64W-COEeCcdJ4iwY6TB7PfPrNL50dF7M",
            appId: "1:274763385147:web:52efd8c47d7b9d2c0f4f1e",
            messagingSenderId: "274763385147",
            projectId: "uniproject-b59d4",
            storageBucket: "uniproject-b59d4.appspot.com"));
  }
  //for android

  else if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD64W-COEeCcdJ4iwY6TB7PfPrNL50dF7M",
            appId: "1:274763385147:android:52efd8c47d7b9d2c0f4f1e",
            messagingSenderId: "274763385147",
            projectId: "uniproject-b59d4",
            storageBucket: "uniproject-b59d4.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
      routes: {
        '/stores': (context) => const Stores(),
        '/logout': (context) => const LoginPage(),
        '/bikehome': (context) => const Bikehome(),
        '/lighthome': (context) => const LightHome(),
        '/heavyhome': (context) => const HeavyHome(),
        '/customer': (context) => const CusHome(),
      },
    );
  }
}
