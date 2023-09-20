
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/container.dart';
import 'package:flutter_application_1/page/custonappbar.dart';


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
                // Navega para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Mercantil (Leão)',
                    imageAsset: 'images/xicoria.png',
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
                    imageAsset: 'images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Serviço (Pinguim)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.45,
              onTap: () {
                // Navega para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Serviço (Pinguim)',
                    imageAsset: 'images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Estrelas (Girafa)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.60,
              onTap: () {
                // Navega para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Estrelas (Girafa)',
                    imageAsset: 'images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Recebimento PNP (Zebrinha)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.75,
              onTap: () {
                // Navega para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Recebimento PNP (Zebrinha)',
                    imageAsset: 'images/xicoria.png',
                  ),
                ));
              },
            ),
            CustomContainer(
              title: 'Produtos S/ Giro (Hipopótamo)',
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.90,
              onTap: () {
                // Navega para a tela desejada ao pressionar o contêiner
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContainerScreen(
                    title: 'Produtos S/ Giro (Hipopótamo)',
                    imageAsset: 'images/xicoria.png',
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
                    imageAsset: 'images/xicoria.png',
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
