class Indicador {
  final String bicho;
  final String descricao;
  final double meta;
  final String icone;

  Indicador({
    required this.bicho,
    required this.descricao,
    required this.meta, 
    required this.icone
  });

  String get nomeDoBicho => bicho;
  String get descricaoDoIndicador => descricao;
  double get metaDoIndicador => meta;
  String get iconeDoIndicador => icone;
}
