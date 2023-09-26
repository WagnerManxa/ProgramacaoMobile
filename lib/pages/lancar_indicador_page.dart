// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_app/providers/app_state.dart';
import 'package:my_app/models/indicador.dart';
import 'package:provider/provider.dart';

class LancarIndicadores extends StatefulWidget {
  final Indicador indicador;

  const LancarIndicadores({Key? key, required this.indicador}) : super(key: key);

  @override
  State<LancarIndicadores> createState() => _LancarIndicadoresState();
}

class _LancarIndicadoresState extends State<LancarIndicadores> {
  final _formKey = GlobalKey<FormState>();
  double? venda; // Variável para armazenar o valor de venda

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.indicador.bicho),
        backgroundColor: Color.fromARGB(255, 148, 11, 11),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.indicador.icone),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Descrição:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(widget.indicador.descricao),
                SizedBox(height: 16),

                TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: "Valor Realizado"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, insira um valor válido.";
                    } else {
                      try {
                        double.parse(value);
                        return null;
                      } catch (e) {
                        return "Não precisa dos centavos ;)";
                      }
                    }
                  },
                  onSaved: (value) {
                    venda = double.parse(value!); // Salva o valor na variável
                  },
                ),
                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final novoValor = venda ?? 0.0; // Obtém o valor da variável
                      appState.atualizarValorRealizado(widget.indicador.bicho, novoValor);
                      Navigator.pop(context, novoValor.toStringAsFixed(2)); // Retorna o valor para a tela anterior
                    }
                  },
                  child: const Text("Salvar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
