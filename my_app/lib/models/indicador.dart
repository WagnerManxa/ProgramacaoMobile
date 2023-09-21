class Indicador {
  String bicho;
  String descricao;
  double meta;
  String icone;

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