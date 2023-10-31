

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/loginpage.dart';
import 'package:flutter_app/providers/app_state.dart';
import 'package:flutter_app/services/autenticservice.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: MyHomePage(),
        home: LoginPage(),
        //LoginPage()
      ),
    );
  }
}