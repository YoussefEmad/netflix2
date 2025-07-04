import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Netflix',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home:HomeScreen() ,
        debugShowCheckedModeBanner: false,
      );
  }
}