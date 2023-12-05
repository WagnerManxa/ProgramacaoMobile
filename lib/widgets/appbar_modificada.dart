// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/lancar_dias.dart';
import 'package:flutter_app/services/autenticservice.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../pages/addvendedorpage.dart';
import '../pages/loginpage.dart';
//import '../repositories/vendedor_repository_static.dart';

//import 'package:image_picker/image_picker.dart';

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
                      IconButton(
                        onPressed: () async {
                          final shouldChangeIcon =
                              await showChangeIconDialog(context);
                          if (shouldChangeIcon != null && shouldChangeIcon) {
                            await pickAndUploadImage(context);
                          }
                        },
                        icon: FutureBuilder<String>(
                          future: fetchProfileImageUrlFromFirestore(),
                          builder: (context, imageUrlSnapshot) {
                            if (imageUrlSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/profile_image.jpeg'),
                                maxRadius: 30,
                              );
                            } else {
                              final imageUrl = imageUrlSnapshot.data;

                              return CircleAvatar(
                                backgroundImage: imageUrl != null &&
                                        imageUrl.isNotEmpty
                                    ? NetworkImage(
                                        imageUrl!)
                                    : AssetImage(
                                        'assets/images/profile_image.jpeg')
                                        as ImageProvider<Object>,
                                maxRadius: 30,
                              );
                            }
                          },
                        ),
                      ),
                      Text(
                        'Olá $nomeVendedor',
                        style: TextStyle(fontSize: 20,  color: Colors.white),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.calendar_today,  color: Colors.white),
                      tooltip: 'Lançar dias úteis e trabalhados',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LancarDias(),
                          ),
                        );
                      },
                    ),
                    if (isManagerValue)
                      IconButton(
                        icon: const Icon(Icons.check,  color: Colors.white),
                        tooltip: 'Aprovar Usuário',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ListaUsuariosPendentesPage(),
                            ),
                          );
                        },
                      ),
                    IconButton(
                      icon: const Icon(Icons.logout,  color: Colors.white),
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

Future<void> pickAndUploadImage(BuildContext context) async {
  try {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      await uploadImage(pickedImageFile);
    }
  } catch (error) {
    print('Erro ao carregar a imagem: $error');
  }
}
  Future<bool?> showChangeIconDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deseja trocar o ícone?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }

  Future<void> uploadImage(File pickedImage) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    final storage = FirebaseStorage.instance;
    final storageRef =
        storage.ref().child('profile_images').child('${user.uid}.jpg');

    await storageRef.putFile(pickedImage);

    await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      {
        'profileImageUrl': await storageRef.getDownloadURL(),
      },
      SetOptions(merge: true),
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

  Future<String> fetchProfileImageUrlFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return '';
    }

    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    return userDoc.data()?['profileImageUrl'] ?? '';
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