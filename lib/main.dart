// ignore_for_file: prefer_const_constructors, dead_code, no_logic_in_create_state, avoid_unnecessary_containers
import 'package:app_api/src/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
    );
  }
}
