import 'package:flutter/material.dart';
import 'package:palestra/src/home/home_module.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeModule(),
    );
  }
}
