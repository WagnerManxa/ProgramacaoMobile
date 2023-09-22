import 'package:flutter/material.dart';
import 'package:flutter_app/pages/lancar_dias.dart';
import 'package:flutter_app/repositories/vendedor_repository_static.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
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
              backgroundImage: AssetImage('images/profile_image.jpeg'),
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
          tooltip: 'Lançar dias úteis e trabalhados.',
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

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(subtitle, style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
