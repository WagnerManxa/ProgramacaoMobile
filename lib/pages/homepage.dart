// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter_app/pages/detalhes_indicador_page.dart';
import 'package:flutter_app/providers/app_state.dart';
import 'package:flutter_app/repositories/excelencia_vendedor.dart';
import 'package:flutter_app/widgets/appbar_modificada.dart';
import 'package:flutter_app/widgets/container_modificado.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
        ContainerModificado(
          title: indicador.bicho,
          subtitle: 'Realizado: ${formatCurrency(Provider.of<AppState>(context).valoresRealizados[indicador.bicho] ?? 0.0)}\nProjeção: ${formatCurrency(calcularProjecao(Provider.of<AppState>(context), indicador.bicho))}',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetalhesIndicador(
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
      appBar: const AppBarModificada(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/xicoria.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2), // Definir a cor de fundo com transparência
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