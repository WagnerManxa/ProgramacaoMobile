// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_app/models/indicador.dart';


import 'lancar_indicador_page.dart';
//import 'indicador.dart';


class DetalheIndicador extends StatefulWidget {
  final Indicador indicador;
  String? realizado; // Variável para armazenar o valor realizado

  DetalheIndicador({super.key, required this.indicador, this.realizado});

  @override
  State<DetalheIndicador> createState() => _DetalheIndicadorState();
}

class _DetalheIndicadorState extends State<DetalheIndicador> {
  void atualizarRealizado(String? novoValor) {
    setState(() {
      widget.realizado = novoValor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.indicador.bicho),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.indicador.icone), // Usar a imagem do indicador
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nome do Indicador:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.indicador.bicho, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16), // Espaçamento entre os elementos

            Text(
              'Descrição:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(widget.indicador.descricao, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16), // Espaçamento entre os elementos

            Text(
              'Meta:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'R\$ ${widget.indicador.meta.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16), // Espaçamento entre os elementos

            Text(
              'Realizado:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'R\$ ${widget.realizado ?? "00.00"}', // Exibe "00.00" se realizado for nulo
              style: TextStyle(
                fontSize: 16,
                color: Colors.green, // Cor verde para o valor realizado
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novoValor = await Navigator.push<String>(
            context,
            MaterialPageRoute(
              builder: (_) => LancarIndicadores(
                indicador: widget.indicador,
              ),
            ),
          );

          if (novoValor != null) {
            atualizarRealizado(novoValor);
          }
        },
        tooltip: 'Lançar o produzito até hoje',        
        child: const Icon(
          Icons.assignment_add,
          color: Colors.black87,
        ),
      ),
    );
  }
}
