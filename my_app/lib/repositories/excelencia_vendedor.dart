



import 'package:flutter_app/models/indicador.dart';


class ExcelenciaVendedor{
  static List<Indicador> excelencia =[
    Indicador(
      bicho: 'Leão',
      descricao: 'Venda Mercantil', 
      meta: 95000.00, 
      icone: 'images/leao.jpg'
      ),
    Indicador(
      bicho: 'Tigre',
      descricao: 'Venda de Juros', 
      meta: 38000.00, 
      icone: 'images/tigre.jpg'
      ),
    Indicador(
      bicho: 'Penguim',
      descricao:'Venda de Serviços: garantia, Seguro prestamista, frete, super caminhão e seguro roubo e furto.', 
      meta:8000.00, 
      icone: 'images/pinguim.jpg'
      ),
    Indicador(
      bicho: 'Girafa',
      descricao: 'Estrelas: Percentual de atingimento da meta de clientes da loja, considerada quantidade de pedidos baixados.', 
      meta: 100.00, 
      icone: 'images/girafa.jpg'
      ),
    Indicador(
      bicho:'Zebrinha',
      descricao: 'PNP 30 dias: Percentual de recebimento da carteira.', 
      meta: 100.00, 
      icone: 'images/zebra.jpg'
      ),
    Indicador(
      bicho: 'Hipopótamo',
      descricao: 'Produtos Sem Giro: Percentual da meta em produtos parados a mais de 120 dias na loja.', 
      meta: 100.00, 
      icone: 'images/hipopotamo.jpg'
      ),
    Indicador(
      bicho: 'Jaguar',
      descricao: 'Plano Controle Bônus: +10 pontos para cada plano controle vendido, limitado a +100 pontos.', 
      meta: 10.00, 
      icone: 'images/jaguar.jpg'
      ),
    Indicador(
      bicho: 'Jaguar',
      descricao: 'Chip c/ Recarga Bônus: +25 pontos para coloaborador que vender o mínimo 5 Chips com recarga.',  
      meta: 5.00, 
      icone: 'images/jaguar.jpg'
      ),                                    

  ];
}