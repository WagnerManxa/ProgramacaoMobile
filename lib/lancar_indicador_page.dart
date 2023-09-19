// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'models/indicador.dart';

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
    return Scaffold(
      appBar: AppBar(
        
         leading: CircleAvatar(
          backgroundImage: AssetImage(widget.indicador.icone)),
        title:
            Text(widget.indicador.bicho),
        ),
     
      body: Padding(
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
              SizedBox(height: 16), // Espaçamento entre a descrição e o campo de entrada

              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: "Valor Realizado"),
                validator: (value) {
                  bool isInteger(String value) {
                    final regExp = RegExp(r"^\d+$");
                    return regExp.hasMatch(value);
                  }
                  if (value == null || value.isEmpty) {
                    return "Por favor, insira um valor válido.";
                  } else if (isInteger(value)) {
                    return "Não esqueça da vírgula (Ex: 0.00)";
                  }
                  return null;
                },
                onSaved: (value) {
                  // Converte o valor em double
                  venda = double.parse(value!);
                },
              ),
              SizedBox(height: 16), // Espaçamento entre o campo de entrada e o botão

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Agora você pode salvar a "venda" no Hive ou fazer o que desejar com ela
                    // Pode ser necessário lidar com a conversão de int para double aqui, dependendo dos requisitos

                    // Retorna o valor da venda para a tela anterior
                    Navigator.pop(context, venda?.toStringAsFixed(2)); // Use toStringAsFixed para formatar como um número decimal com 2 casas
                  }
                },
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
