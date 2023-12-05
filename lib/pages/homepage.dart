

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/detalhes_indicador_page.dart';
import 'package:flutter_app/providers/app_state.dart';
import 'package:flutter_app/repositories/excelencia_vendedor.dart';
import 'package:flutter_app/widgets/appbar_modificada.dart';
import 'package:flutter_app/widgets/container_modificado.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage();

  // Formatar dinheiro
  String formatCurrency(double value) {
    final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return currencyFormat.format(value);
  }

  List<Widget> buildIndicatorWidgets(BuildContext context) {
    final indicatorWidgets = <Widget>[];

    for (final indicador in ExcelenciaVendedor.excelencia) {
      final double progress = formatarRealizadoPercentual(
          Provider.of<AppState>(context), indicador.bicho, indicador.meta);

      final double projectionProgress = formatarProjecaoPercentual(
          Provider.of<AppState>(context), indicador.bicho, indicador.meta);

      indicatorWidgets.add(
        ContainerModificado(
          title: indicador.bicho,
          subtitle:
              'Realizado: ${formatCurrency(Provider.of<AppState>(context).valoresRealizados[indicador.bicho] ?? 0.0)}\nProjeção: ${formatCurrency(calcularProjecao(Provider.of<AppState>(context), indicador.bicho) )}',
          progress: progress,
          projectionProgress: projectionProgress,
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
    if (projecao >= 0.0)  {
      return projecao;
    }else {
    return 0.0;
    }
  }

  double formatarProjecaoPercentual(AppState appState, String indicador, double meta) {
    final double valorProjecao = calcularProjecao(appState, indicador);
    double percentualProjecao = valorProjecao / meta;
    return percentualProjecao;
  }

  double formatarRealizadoPercentual(AppState appState, String indicador, double meta) {
    final double valorRealizado = appState.valoresRealizados[indicador] ?? 0.0;
    double percentualRealizado = valorRealizado / meta;
    if (percentualRealizado >1 ){
      return 1;
    } else {
    return percentualRealizado;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarModificada(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/xicoria.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.dstATop,
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
