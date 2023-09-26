// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/lancar_dias.dart';

import '../repositories/vendedor_repository_static.dart';


class AppBarModificada extends StatelessWidget implements PreferredSizeWidget {
  const AppBarModificada({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final nomeVendedor = VendedorRepositoryStatic.vendedores[0].nome;

    return AppBar(
      title: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_image.jpeg'),
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
          tooltip: 'Lançar dias úteis e trabalhados.cs',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LancarDias(),
              ),
            );
          },
        ),
      ],
      backgroundColor: Color.fromARGB(255, 148, 11, 11),
    );
  }
}