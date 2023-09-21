

import 'package:flutter_app/models/indicador.dart';
import 'package:flutter_app/models/vendedor.dart';


class RealizadoVendedor{
  static List<Vendedor> coloaborador =[
    Vendedor(
      nome: '', 
      sobrenome: '', 
      matricula: 000
      ),
  ];
  static List<Indicador> realizado =[
    Indicador(
      bicho: 'Leão',
      descricao: 'Venda Mercantil', 
      meta: 95000.00, 
      icone: 'images/leao.png'
      ),
    Indicador(
      bicho: 'Tigre',
      descricao: 'Venda de Juros', 
      meta: 38000.00, 
      icone: 'images/tigre.png'
      ),
    Indicador(
      bicho: 'Penguim',
      descricao:'Venda de Serviços, garantia, Seguro prestamista, frete, super caminhão e seguro roubo e furto.', 
      meta:8000.00, 
      icone: 'images/pinguim.png'
      ),
    Indicador(
      bicho: 'Girafa',
      descricao: 'Percentual de atingimento da meta de clientes da loja, considerada quantidade de pedidos baixados.', 
      meta: 100.00, 
      icone: 'images/girafa.png'
      ),
    Indicador(
      bicho:'Zebrinha',
      descricao: 'Percentual de recebimento da carteira PNP 30 dias.', 
      meta: 100.00, 
      icone: 'images/zebra.png'
      ),
    Indicador(
      bicho: 'Hipopótamo',
      descricao: 'Percentual da meta de produtos sem giro a mais de 120 dias da loja.', 
      meta: 100.00, 
      icone: 'images/hipopotamo.png'
      ),
    Indicador(
      bicho: 'Jaguar Controle',
      descricao: 'Bônus para coloaborador de +10 pontos para cada plano controle vendido, limitado a +100 pontos.', 
      meta: 10.00, 
      icone: 'images/jaguar.png'
      ),
    Indicador(
      bicho: 'Jaguar Chip',
      descricao: 'Bônus de +25 pontos para coloaborador que vender o mínimo 5 Chips com recarga.',  
      meta: 5.00, 
      icone: 'images/jaguar.png'
      ),                                    

  ];
}