import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/custom.dart';
import 'package:flutter_app/pages/detalhes_indicador_page.dart';
import 'package:flutter_app/repositories/excelencia_vendedor.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
            image: AssetImage('images/xicoria.png'),
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