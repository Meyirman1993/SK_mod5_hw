import 'package:flutter/material.dart';
import './main_page.dart';

void main(List<String> args) {
  runApp(const HomeWork());
}

class HomeWork extends StatelessWidget {
  const HomeWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: const ColorScheme.dark()),
      home: const MainPageWidget(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}
