import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gemini_tutorial/app.dart';
import 'package:gemini_tutorial/locator.dart';
import 'package:gemini_tutorial/observer.dart';
import 'package:gemini_tutorial/services/gemini_service.dart';

late final GeminiService service;
void main() async {
  service = GeminiService();
  await service.init();
  await service.startChat();
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  Bloc.observer = MyObeserver();
  runApp(const MyApp());
}
