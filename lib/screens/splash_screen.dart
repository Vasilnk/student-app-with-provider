import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/providers/login_provider.dart';
import 'package:student_app/screens/home_page.dart';
import 'package:student_app/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    await Future.delayed(const Duration(seconds: 3));
    await context.read<LoginProvider>().checkIfLoggedIn();
    final isLoggedIn = context.read<LoginProvider>().isLoggedIn;

    if (isLoggedIn) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 110,
                height: 110,
                child: Image.asset('assets/images/images-modified.png')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'My School',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontFamily: 'DelaGothicOne',
                  fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
