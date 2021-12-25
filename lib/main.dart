import 'package:astro_tak/API/astro_api.dart';
import 'package:astro_tak/screens/astrologer_screen/astro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ChangeNotifierProvider(
        create: (context) => AstroAPI(),
        builder: (context, child) {
          return AstroPage();
        },
      ),
    );
  }
}
