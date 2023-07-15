import 'package:flutter/material.dart';
import 'package:rss/widgets/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home:const HomePage( title: ""),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      color: Colors.teal,
    );
  }
}
