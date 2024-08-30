import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_todo2/screen/edit_screen.dart';
import 'package:project_todo2/screen/home/home.dart';
import 'package:project_todo2/splash/splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Splash.routeNamed: (_) => Splash(),
        Home.routeNamed: (_) => Home(),
        EditScreen.routeNamed: (_) => EditScreen()
      },
      initialRoute: Splash.routeNamed,
    );
  }
}
