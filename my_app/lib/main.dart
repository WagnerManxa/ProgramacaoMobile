import 'package:flutter/material.dart';
import 'package:flutter_app/configs/app_settings.dart';
import 'package:flutter_app/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.initHive();

  runApp(const MyApp());
}


