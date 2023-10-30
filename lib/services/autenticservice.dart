import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  User? usuario;
  bool isLoading = true;
  

  AuthService() {
   // createAdmin();
    authCheck();
  }

  authCheck() {
    auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  getUser() {
    usuario = auth.currentUser;
    notifyListeners();
  }

  Future<void> login(String email, String senha) async {
    try {
      UserCredential userCredential =
          await auth.signInWithEmailAndPassword(email: email, password: senha);
      if (userCredential.user != null) {
        
        getUser();
      } else {
        throw AuthException('Não foi possível autenticar o usuário.');
      }
    } on FirebaseAuthException catch (e) {
     
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta.');
      } else {
        throw AuthException('Erro desconhecido durante o login: ${e.message}');
      }
    }
  }

 Future<void> registrar(String email, String senha, String matricula, String nome, String sobrenome,
    {bool isManager = false, bool isApproved = false}) async {
  try {
    final UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );

    if (userCredential.user != null) {
      final User? user = userCredential.user;

      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'email': email,
        'matricula': matricula,
        'isManager': isManager,
        'isApproved': isApproved,
        'nome': nome, 
        'sobrenome': sobrenome, 
      });

      
      getUser();
    } else {
      throw AuthException('Não foi possível registrar o usuário.');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw AuthException('A senha deve conter pelo menos 6 caracteres.');
    } else if (e.code == 'email-already-in-use') {
      throw AuthException('Este email já está cadastrado.');
    } else {
      throw AuthException('Erro desconhecido durante o registro: ${e.message}');
    }
  }
}

Future<bool> isUserApproved(User user) async {
  if (user != null) {
    try {
      final userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        final isApproved = userDoc.data()?['isApproved'] ?? false;
        print('Valor de isApproved: $isApproved');
        return isApproved;
      } else {
        print('Documento do usuário não encontrado no Firestore.');
      }
    } catch (e) {
      print('Erro ao consultar o Firestore: $e');
    }
  } else {
    print('Usuário não autenticado.');
  }

  return false; 
}

  logout() async {
    await auth.signOut();
    getUser();
  }

  Future<void> createAdmin() async {
  try {
    final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: 'admin@admin.com',
      password: 'admin1',
    );

    final User? user = userCredential.user;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': 'admin@admin.com',
        'matricula': '0003',
        'isManager': true,
        'isApproved': true,
        
      });

      print('Usuário administrador criado com sucesso no Firebase Authentication e no Firestore.');
    }
  } catch (e) {
    print('Erro ao criar usuário administrador: $e');
  }
}
}
