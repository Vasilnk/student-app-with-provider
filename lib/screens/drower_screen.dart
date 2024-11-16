import 'package:flutter/material.dart';
import 'package:student_app/screens/about_page.dart';
import 'package:student_app/screens/logout.dart';
import 'package:student_app/screens/privacy_policy.dart';
import 'package:student_app/screens/profile.dart';

class DrowerScreen extends StatelessWidget {
  DrowerScreen({super.key, required this.schoolName});
  final String schoolName;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> sidePanelItems = [
    {
      'icon': Icons.person,
      'title': 'Profile',
      'screen': const SchoolProfileScreen()
    },
    {
      'icon': Icons.logout_outlined,
      'title': 'Log Out',
    },
    {
      'icon': Icons.privacy_tip,
      'title': 'Privacy and Policy',
      'screen': const PrivacyPolicyPage()
    },
    {'icon': Icons.info, 'title': 'About', 'screen': const AboutPage()}
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: scaffoldKey,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/school.jpeg'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    schoolName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = sidePanelItems[index];
                  return ListTile(
                    leading: Icon(item['icon']),
                    title: Text(item['title']),
                    onTap: () {
                      if (index == 1) {
                        logoutFunction(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => item['screen'],
                          ),
                        );
                      }
                    },
                  );
                },
                itemCount: sidePanelItems.length,
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
