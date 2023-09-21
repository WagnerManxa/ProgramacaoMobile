import 'dart:io';
import 'package:flutter_app/adaptors/indicador_hive_adapdor.dart';
import 'package:flutter_app/models/indicador.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../adaptors/vendedor_hive_adaptor.dart';
import '../models/vendedor.dart';

class HiveConfig {
  static Future<void> initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    // Registre os adaptadores necessários aqui.
    Hive.registerAdapter<Indicador>(IndicadorHiveAdapter()); // Use o nome correto do adaptador
    Hive.registerAdapter<Vendedor>(VendedorHiveAdapter()); // Use o nome correto do adaptador

    // Abra as caixas (boxes) que você deseja usar.
    await Hive.openBox<Indicador>('indicadores');
    await Hive.openBox<Vendedor>('vendedores');
  }
}
