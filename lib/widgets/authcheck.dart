import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/pages/loginpage.dart';
import 'package:flutter_app/services/autenticservice.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget{
  AuthCheck({Key? key}) : super(key: key);

  @override
  AuthCheckState createState() => AuthCheckState();

}

class AuthCheckState extends State<AuthCheck>{
  @override
  Widget build(BuildContext context){
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading) 
    return loading();
    else if(auth.usuario == null) 
    return LoginPage();
    else 
    return MyHomePage();
    
  }

  loading(){
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}