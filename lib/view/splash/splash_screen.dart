import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kezel/provider/data_provider.dart';
import 'package:kezel/view/home/home_screen.dart';
import 'package:kezel/view/login/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    fetchDataAndNavigate();
  }

  Future<void> fetchDataAndNavigate() async {
    try {
      await Provider.of<DataProvider>(context, listen: false).fetchData();

      navigateToNextScreen();
    } catch (e) {
    
      // ignore: use_build_context_synchronously
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to load data. Please try again.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                 fetchDataAndNavigate();
              },
            ),
          ],
        );
      },
    );

    }
  }

  void navigateToNextScreen() {
    final user = _auth.currentUser;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        if (user != null) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
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
