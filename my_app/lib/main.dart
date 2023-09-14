// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomContainer(
              title: 'Mercantil (Leão)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                // Navegue para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Mercantil (Leão)',
                    imageAsset: 'assets/images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Juros (Tigre)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.30,
              onTap: () {
                // Navegue para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Juros (Tigre)',
                    imageAsset: 'assets/images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Serviço (Pinguim)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.45,
              onTap: () {
                // Navegue para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Serviço (Pinguim)',
                    imageAsset: 'assets/images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Estrelas (Girafa)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.60,
              onTap: () {
                // Navegue para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Estrelas (Girafa)',
                    imageAsset: 'assets/images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Recebimento PNP (Zebrinha)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.75,
              onTap: () {
                // Navegue para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Recebimento PNP (Zebrinha)',
                    imageAsset: 'assets/images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Produtos S/ Giro (Hipopótamo)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.90,
              onTap: () {
                // Navegue para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Produtos S/ Giro (Hipopótamo)',
                    imageAsset: 'assets/images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Bônus Tim Controle (Jaguar)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 1.0,
              onTap: () {
                // Navegue para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Bônus Tim Controle (Jaguar)',
                    imageAsset: 'assets/images/xicoria.png',
                  ),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
              backgroundImage: AssetImage('assets/images/profile_image.jpeg'),
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

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progressValue;
  final VoidCallback onTap;

  const CustomContainer({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.progressValue,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
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
                Text(title, style: TextStyle(fontSize: 18)),
                Text(subtitle, style: TextStyle(fontSize: 14)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerScreen extends StatelessWidget {
  final String title;
  final String imageAsset;

  const ContainerScreen({
    Key? key,
    required this.title,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
