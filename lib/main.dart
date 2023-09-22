// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/detalhes_indicador_page.dart';
import 'package:my_app/pages/lancar_dias.dart';
import 'package:my_app/repositories/excelencia_vendedor.dart';
import 'package:my_app/repositories/vendedor_repository_static.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage();

//formatar dinheiro
  String formatCurrency(double value) {
    final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return currencyFormat.format(value);
  }

  List<Widget> buildIndicatorWidgets(BuildContext context) {
    final indicatorWidgets = <Widget>[];

    for (final indicador in ExcelenciaVendedor.excelencia) {
      indicatorWidgets.add(
        CustomContainer(
          title: indicador.bicho,
          subtitle: 'Realizado: ${formatCurrency(Provider.of<AppState>(context).valoresRealizados[indicador.bicho] ?? 0.0)}\nProjeção: ${formatCurrency(calcularProjecao(Provider.of<AppState>(context), indicador.bicho))}',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetalheIndicador(
                  indicador: indicador,
                  realizado: '00.00',
                ),
              ),
            );
          },
        ),
      );
    }
    return indicatorWidgets;
  }

  double calcularProjecao(AppState appState, String indicador) {
    final double valorRealizado = appState.valoresRealizados[indicador] ?? 0.0;
    final int diasTrabalhados = appState.diasTrabalhados;
    final int diasUteis = appState.diasUteis;

    final double projecao = (valorRealizado / diasTrabalhados) * diasUteis;
    return projecao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/xicoria.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), // Defina a cor de fundo com transparência
              BlendMode.dstATop, // Modo de mesclagem para aplicar transparência
            ),
          ),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ...buildIndicatorWidgets(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
