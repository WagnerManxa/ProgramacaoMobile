// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_app/providers/app_state.dart';
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
        backgroundColor: Color.fromARGB(255, 148, 11, 11),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, insira um valor válido.";
                  } else {
                    final int diasUteis = int.tryParse(value) ?? 0;
                    if (diasUteis < 0 || diasUteis > 30) {
                      return "Os dias úteis devem estar entre 0 e 30.";
                    }
                    return null;
                  }
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor, insira um valor válido.";
                  } else {
                    final int diasTrabalhados = int.tryParse(value) ?? 0;
                    final int diasUteis = int.tryParse(diasUteisController.text) ?? 0;
                    if (diasTrabalhados < 0 || diasTrabalhados > diasUteis) {
                      return "Valor deve estar entre 0 e os dias úteis informados.";
                    }
                    return null;
                  }
                },
                onSaved: (value) {
                  appState.atualizarDiasTrabalhados(int.tryParse(value ?? '0') ?? 0);
                },
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
