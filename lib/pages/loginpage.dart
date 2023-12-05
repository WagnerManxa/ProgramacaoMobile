import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/homepage.dart';
import 'package:flutter_app/services/autenticservice.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final user = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final matricola = TextEditingController();
  final senha = TextEditingController();
  final nomeController = TextEditingController(); 
  final sobrenomeController = TextEditingController(); 

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem Vindo';
        actionButton = 'Login';
        toggleButton = 'Cadastre-se agora';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar para login';
      }
    });
  }

  login() async {
    try {
      await context.read<AuthService>().login(email.text, senha.text);
      final user = await context.read<AuthService>().usuario;
      final isApproved =
          await context.read<AuthService>().isUserApproved(user!);

      if (isApproved) {
       
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyHomePage()));
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Seu cadastro ainda não foi aprovado.')));
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    try {
      await context.read<AuthService>().registrar(
            email.text,
            senha.text,
            matricola.text,
            nomeController.text, 
            sobrenomeController.text, 
          );  
      final user = await context.read<AuthService>().usuario;
      final isApproved =
          await context.read<AuthService>().isUserApproved(user!);

      if (isApproved) {
        
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyHomePage()));
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Seu cadastro ainda não foi aprovado.')));
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o email corretamente!!!';
                      }
                      return null;
                    },
                  ),
                ),
                if (!isLogin) 
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: TextFormField(
                      controller: nomeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome', 
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o nome corretamente!!!';
                        }
                        return null;
                      },
                    ),
                  ),
                if (!isLogin) 
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: TextFormField(
                      controller: sobrenomeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Sobrenome', 
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o sobrenome corretamente!!!';
                        }
                        return null;
                      },
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  child: TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe a Senha!!!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(24.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          login();
                        } else {
                          registrar();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 148, 11, 11), 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check,  color: Colors.white),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            actionButton,
                            style: TextStyle(fontSize: 20,  color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(toggleButton)),
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
