class Vendedor {
  final String nome;
  final String sobrenome;
  final int matricula;

  Vendedor({
    required this.nome,
    required this.sobrenome,
    required this.matricula,
  });

  
  String get nomeCompleto => '$nome $sobrenome';
  int get numeroMatricula => matricula;

  
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'sobrenome': sobrenome,
      'matricula': matricula,
    };
  }

 
  static Vendedor fromJson(Map<String, dynamic> json) {
    return Vendedor(
      nome: json['nome'],
      sobrenome: json['sobrenome'],
      matricula: json['matricula'],
    );
  }
}
