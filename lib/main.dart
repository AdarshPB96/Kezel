import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kezel/firebase_options.dart';
import 'package:kezel/view/home/home_screen.dart';
import 'package:kezel/view/login/login_screen.dart';
import 'package:kezel/view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),

        ),
        home: HomeScreen());
  }
}
