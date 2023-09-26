// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter_app/models/indicador.dart';
import 'package:flutter_app/pages/lancar_indicador_page.dart';
import 'package:flutter_app/providers/app_state.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class DetalhesIndicador extends StatefulWidget {
  final Indicador indicador;
  String? realizado;

  DetalhesIndicador({super.key, required this.indicador, this.realizado});

  @override
  State<DetalhesIndicador> createState() => _DetalhesIndicadorState();
}

class _DetalhesIndicadorState extends State<DetalhesIndicador> {
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
        backgroundColor: Color.fromARGB(255, 148, 11, 11), 
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.indicador.icone),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop,
              ),
            ),
          ),
          child: Padding(
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
                SizedBox(height: 16),

                Text(
                  'Descrição:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.indicador.descricao, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),

                Text(
                  'Meta:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2).format(widget.indicador.meta)}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),

                Text(
                  'Realizado:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2).format(Provider.of<AppState>(context).valoresRealizados[widget.indicador.bicho] ?? 0.0)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 2, 48, 85),
                  ),
                ),
              ],
            ),
          ),
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

