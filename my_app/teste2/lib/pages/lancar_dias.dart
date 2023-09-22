// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/app_state.dart';
import 'package:provider/provider.dart';

class LancarDias extends StatefulWidget {
  @override
  _LancarDiasState createState() => _LancarDiasState();
}

class _LancarDiasState extends State<LancarDias> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController diasTrabalhadosController = TextEditingController();
  TextEditingController diasUteisController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final appState = Provider.of<AppState>(context, listen: false);
    diasTrabalhadosController.text = appState.diasTrabalhados.toString();
    diasUteisController.text = appState.diasUteis.toString();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Informar Dias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dias Úteis:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: diasUteisController,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                 
                  appState.atualizarDiasUteis(int.tryParse(value ?? '0') ?? 0);
                },
              ),
              SizedBox(height: 16),
              Text(
                "Dias Trabalhados:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: diasTrabalhadosController,
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  
                  appState.atualizarDiasTrabalhados(int.tryParse(value ?? '0') ?? 0);
                },
              ),
              SizedBox(height: 16),

              Text(
                "Dias Úteis:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Valor atual: ${appState.diasUteis}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),

              Text(
                "Dias Trabalhados:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Valor atual: ${appState.diasTrabalhados}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context);
                  }
                },
                child: Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
