import 'package:flutter_app/models/indicador.dart';


class ExcelenciaVendedor{
  static List<Indicador> excelencia =[
    Indicador(
      bicho: 'Leão',
      descricao: 'Venda Mercantil', 
      meta: 95000.00, 
      icone: 'assets/images/leao.jpg'
      ),
    Indicador(
      bicho: 'Tigre',
      descricao: 'Venda de Juros', 
      meta: 38000.00, 
      icone: 'assets/images/tigre.jpg'
      ),
    Indicador(
      bicho: 'Penguim',
      descricao:'Venda de Serviços: garantia, Seguro prestamista, frete, super caminhão e seguro roubo e furto.', 
      meta:8000.00, 
      icone: 'assets/images/pinguim.jpg'
      ),
   /* Indicador(
      bicho: 'Girafa',
      descricao: 'Estrelas: Percentual de atingimento da meta de clientes da loja, considerada quantidade de pedidos baixados.', 
      meta: 100.00, 
      icone: 'assets/images/girafa.jpg'
      ),*/
    /*
    Indicador(
      bicho:'Zebrinha',
      descricao: 'PNP 30 dias: Valor recebido da carteira.', 
      meta: 9354.00, 
      icone: 'assets/images/zebra.jpg'
      ),
    */
    Indicador(
      bicho: 'Hipopótamo',
      descricao: 'Produtos Sem Giro: Venda produtos em status vermelho da loja.', 
      meta: 24735.00, 
      icone: 'assets/images/hipopotamo.jpg'
      ),
   /* Indicador(
      bicho: 'Jaguar Controle',
      descricao: 'Bônus +10 pontos para cada plano controle vendido, limitado a +100 pontos.', 
      meta: 10.00, 
      icone: 'assets/images/jaguar.jpg'
      ),*/
      /*
    Indicador(
      bicho: 'Jaguar Chip',
      descricao: 'Bônus +25 pontos para coloaborador que vender o mínimo 5 Chips com recarga.',  
      meta: 100.00, 
      icone: 'assets/images/jaguar.jpg'
      ),  
      */                           

  ];
}