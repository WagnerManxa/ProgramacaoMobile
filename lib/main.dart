import 'package:flutter/material.dart';
import 'package:my_app/configs/app_settings.dart';
import 'package:my_app/detalhes_indicador_page.dart';
import 'package:my_app/repositories/excelencia_vendedor.dart';
import 'models/indicador.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.initHive();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  
  get indicador => null;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomContainer(
              title: ExcelenciaVendedor.excelencia[0].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[0].bicho,
                      descricao: ExcelenciaVendedor.excelencia[0].descricao, 
                      meta: ExcelenciaVendedor.excelencia[0].meta, 
                      icone: ExcelenciaVendedor.excelencia[0].icone,
                      ), 
                      realizado: '00.00',
                      )
                ));
              },
            ),
            CustomContainer(
              title: ExcelenciaVendedor.excelencia[1].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[1].bicho,
                      descricao: ExcelenciaVendedor.excelencia[1].descricao, 
                      meta: ExcelenciaVendedor.excelencia[1].meta, 
                      icone: ExcelenciaVendedor.excelencia[1].icone,
                    ), realizado: '00.00',)
                ));
              },
            ),
            CustomContainer(
              title: ExcelenciaVendedor.excelencia[2].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[2].bicho,
                      descricao: ExcelenciaVendedor.excelencia[2].descricao, 
                      meta: ExcelenciaVendedor.excelencia[2].meta, 
                      icone: ExcelenciaVendedor.excelencia[2].icone,
                    ), realizado: '00.00',)
                ));
              },
            ),
            CustomContainer(
              title: ExcelenciaVendedor.excelencia[3].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[3].bicho,
                      descricao: ExcelenciaVendedor.excelencia[3].descricao, 
                      meta: ExcelenciaVendedor.excelencia[3].meta, 
                      icone: ExcelenciaVendedor.excelencia[3].icone,
                    ), realizado: '00.00',)
                ));
              },
            ),
            CustomContainer(
              title: ExcelenciaVendedor.excelencia[4].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[4].bicho,
                      descricao: ExcelenciaVendedor.excelencia[4].descricao, 
                      meta: ExcelenciaVendedor.excelencia[4].meta, 
                      icone: ExcelenciaVendedor.excelencia[4].icone,
                    ), realizado: '00.00',)
                ));
              },
            ),
            CustomContainer(
              title: ExcelenciaVendedor.excelencia[5].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[5].bicho,
                      descricao: ExcelenciaVendedor.excelencia[5].descricao, 
                      meta: ExcelenciaVendedor.excelencia[5].meta, 
                      icone: ExcelenciaVendedor.excelencia[5].icone,
                    ), realizado: '00.00',)
                ));
              },
            ),
            CustomContainer(
              title: ExcelenciaVendedor.excelencia[6].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[6].bicho,
                      descricao: ExcelenciaVendedor.excelencia[6].descricao, 
                      meta: ExcelenciaVendedor.excelencia[6].meta, 
                      icone: ExcelenciaVendedor.excelencia[6].icone,
                    ), realizado: '00.00',)
                ));
              },
            ),
            CustomContainer(
              
              title: ExcelenciaVendedor.excelencia[7].bicho,
              subtitle: 'Realizado: [var]\nProjeção: [(var/d_v)*d_u]',
              progressValue: 0.15,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetalheIndicador(
                    indicador: Indicador(  // Substitua isso pela instância do Indicador desejado
                      bicho: ExcelenciaVendedor.excelencia[7].bicho,
                      descricao: ExcelenciaVendedor.excelencia[7].descricao, 
                      meta: ExcelenciaVendedor.excelencia[7].meta, 
                      icone: ExcelenciaVendedor.excelencia[7].icone,
                    ), realizado: '00.00',)
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
        title: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_image.jpeg'),
            ),
          ),
          Text('Olá João'),
           Spacer(),
            Padding(
             padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              value: 0.40,
              backgroundColor: Colors.yellow,
            ),
          ),
        ],
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
                Text(title, style: const TextStyle(fontSize: 18)),
                Text(subtitle, style: const TextStyle(fontSize: 14)),
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
