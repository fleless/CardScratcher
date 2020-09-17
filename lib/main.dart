import 'package:cardscratcher/src/modules/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// Application entry point
// Wraps  main module in ModularApp to initialize it with Modular
void main() => runApp(ModularApp(module: AppModule()));
