import 'package:flutter/material.dart';
import 'package:kezel/constants/size.dart';
import 'package:kezel/domain/firebase_auth/firebase_google_login.dart';
import 'package:kezel/view/login/widgets/login_widgets.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    Firebaseauth auth = Firebaseauth();
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            ClipPathContainer(h: h, w: w),
            LottieBuilder.asset(
              "assets/animations/Animation - 1697218268859.json",
              height: h * 0.25,
              // width: 400,
            ),
            tSizedBoxHeight50,

            GoogleSignInContainer(
              h: h,
              ontap: () {
                auth.signInWithGoogle(context);
              },
            )
          ],
        ),
      ),
    );
  }
}


