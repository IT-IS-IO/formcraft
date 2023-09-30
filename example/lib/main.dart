import 'package:flutter/material.dart';
import 'package:formcraft/formcraft.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const Center(
        child: FormCraft(
          data: {
            "type": "scaffold",
            "appbar": {
              "title": "FormCraft",
              // "backgroundColor": "#000",
              // "titleColor": "#fff"
            },
            "child": {
              "type": "text",
              "title": "Hello FormCraft!",
            },
            // "color": "#000"
          },
        ),
      ),
    );
  }
}
