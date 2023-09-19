class Indicador {
  double meta;
  double vendasRealizadas;
  int diasUteis;
  int diasTrabalhados;
  int diasDoMes;

  Indicador({
    required this.meta,
    required this.vendasRealizadas,
    required this.diasUteis,
    required this.diasTrabalhados,
    required this.diasDoMes,
  });

  double calcularProjecao() {
    return (vendasRealizadas / diasTrabalhados) * diasUteis;
  }
}