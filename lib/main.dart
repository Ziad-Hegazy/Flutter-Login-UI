import 'package:flutter_application_1/styles/theme.dart';

import '/views/home_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme:AppTheme.main,home:HomePage());
  }
}
