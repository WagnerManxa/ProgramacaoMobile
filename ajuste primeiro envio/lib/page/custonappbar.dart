
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('images/profile_image.jpeg'),
            ),
          ),
          Text('Olá João'),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              value: 0.40,
              backgroundColor: Colors.yellow,
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}