import 'package:flutter/material.dart';

class GoogleSignInContainer extends StatelessWidget {
  const GoogleSignInContainer(
      {super.key, required this.h, required this.ontap});

  final double h;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        height: h * 0.08,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: h * 0.06,
                // width: 0,
                child: Image.asset('assets/New-Google-Logo.jpg')),
            Text(
              'Sign in with Google',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.quadraticBezierTo(0, size.height, size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipPathContainer extends StatelessWidget {
  const ClipPathContainer({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        height: h * 0.20,
        width: w,
        color: const Color.fromARGB(255, 105, 186, 252),
      ),
    );
  }
}