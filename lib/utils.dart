import 'package:flutter/material.dart';
import 'package:student_app/screens/about_page.dart';
import 'package:student_app/screens/privacy_policy.dart';
import 'package:student_app/screens/profile.dart';

class Utils {
  static List<String> division = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J'
  ];
  static List<String> classNumber = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  static List<Map<String, dynamic>> sidePanelItems = [
    {'icon': Icons.person, 'title': 'Profile', 'screen': SchoolProfileScreen()},
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
}
