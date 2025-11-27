//import 'dart:js';

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:note_app/models/note_database.dart';
import 'package:note_app/pages/note_page.dart';
import 'package:note_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // intialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabse.initialize();

  runApp(MultiProvider(
    providers: [
      // Note provider
      ChangeNotifierProvider(
        create: (context) => NoteDatabse(),
      ),
      // Theme provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Notepage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
