// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/lancar_dias.dart';
import 'package:flutter_app/services/autenticservice.dart';
import 'package:provider/provider.dart';
import '../pages/addvendedorpage.dart';
import '../pages/loginpage.dart';
import '../repositories/vendedor_repository_static.dart';

class AppBarModificada extends StatelessWidget implements PreferredSizeWidget {
  const AppBarModificada({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchUserNameFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppBar(
            title: Text('Carregando...'),
          );
        } else {
          final nomeVendedor = snapshot.data ?? 'Usuário';

          return FutureBuilder<bool>(
            future: fetchIsManagerFromFirestore(),
            builder: (context, managerSnapshot) {
              if (managerSnapshot.connectionState == ConnectionState.waiting) {
                return AppBar(
                  title: Text('Carregando...'),
                );
              } else {
                final isManagerValue = managerSnapshot.data ?? false;

                return AppBar(
                  title: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile_image.jpeg'),
                          maxRadius: 25,
                        ),
                      ),
                      Text(
                        'Olá $nomeVendedor',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      tooltip: 'Lançar dias úteis e trabalhados',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LancarDias(),
                          ),
                        );
                      },
                    ),
                    if (isManagerValue) // Verifica se o usuário é um gerente
                      IconButton(
                        icon: const Icon(Icons.check),
                        tooltip: 'Aprovar Usuário',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ListaUsuariosPendentesPage(),
                            ),
                          );
                        },
                      ),
                    IconButton(
                      icon: const Icon(Icons.logout),
                      tooltip: 'Sair',
                      onPressed: () async {
                        await context.read<AuthService>().logout();
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                  backgroundColor: Color.fromARGB(255, 148, 11, 11),
                );
              }
            },
          );
        }
      },
    );
  }

  Future<String> fetchUserNameFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return 'Usuário';
    }

    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      return userDoc.data()?['nome'] ?? 'Usuário';
    }

    return 'Usuário';
  }

  Future<bool> fetchIsManagerFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    }

    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      return userDoc.data()?['isManager'] ?? false;
    }

    return false;
  }
}