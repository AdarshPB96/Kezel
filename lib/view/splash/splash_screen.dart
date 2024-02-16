import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  // final FirebaseAuth  _auth = FirebaseAuth.instance;
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tSize = MediaQuery.of(context).size;
    Future.delayed(const Duration(seconds: 4), () {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => StreamBuilder<User?>(
      //           stream: _auth.authStateChanges(),
      //           builder: (context, snapshot) {
      //             if (snapshot.connectionState == ConnectionState.waiting) {
      //               return const Scaffold(
      //                 body: Center(child: CircularProgressIndicator()),
      //               );
      //             } else {
      //               if (snapshot.hasData) {
      //                 return MainScreen();
      //               } else {
      //                 return const FirstPage();
      //               }
      //             }
      //           },
      //         )));
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/1656500094.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
