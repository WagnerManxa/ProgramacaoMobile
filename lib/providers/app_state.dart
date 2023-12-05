import 'package:flutter/foundation.dart';

class AppState with ChangeNotifier {
  
  Map<String, double> valoresRealizados = {};
  int diasTrabalhados = 0;
  int diasUteis = 0; 

  void atualizarValorRealizado(String indicador, double valor) {
    valoresRealizados[indicador] = valor;
    notifyListeners();
  }

  void atualizarDiasTrabalhados(int dias) {
    diasTrabalhados = dias;
    notifyListeners();
  }

  void atualizarDiasUteis(int dias) {
    diasUteis = dias;
    notifyListeners();
  }

  
}
