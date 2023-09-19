class Vendedor{
  String nome;
  String sobrenome;
  int matricula;
  
  Vendedor({
    required this.nome,
    required this.sobrenome,
    required this.matricula,
  });

  get nomeCompleto => '$nome $sobrenome';

}