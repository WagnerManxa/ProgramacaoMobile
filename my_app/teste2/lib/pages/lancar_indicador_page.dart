// ignore_for_file: prefer_const_constructors

import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/models/indicador.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class LancarIndicadores extends StatefulWidget {
  final Indicador indicador;

  const LancarIndicadores({Key? key, required this.indicador}) : super(key: key);

  @override
  State<LancarIndicadores> createState() => _LancarIndicadoresState();
}

class _LancarIndicadoresState extends State<LancarIndicadores> {
  final _formKey = GlobalKey<FormState>();
  double? venda;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.indicador.bicho),
        backgroundColor: Color.fromARGB(255, 148, 11, 11), // Cor de fundo personalizada da AppBar
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
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: "Valor Realizado"),
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
                    venda = double.parse(value!);
                  },
                ),
                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      appState.atualizarValorRealizado(widget.indicador.bicho, venda ?? 0.0);
                      Navigator.pop(context, venda?.toStringAsFixed(2));
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
