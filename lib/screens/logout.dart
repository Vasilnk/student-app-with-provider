import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/providers/login_provider.dart';
import 'package:student_app/screens/login.dart';

logoutFunction(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                confirmLogout(context);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}

void confirmLogout(BuildContext context) async {
  context.read<LoginProvider>().logout();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
    (Route<dynamic> route) => false,
  );
}
