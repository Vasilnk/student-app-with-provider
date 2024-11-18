import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'About Our School Management App',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'This School Management App helps administrators manage their school efficiently. It allows schools to add students, view detailed information for each student, and easily track student records. Whether you are a small or large institution, this app offers an easy-to-use solution for organizing and maintaining student data.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Key Features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '- Add and manage multiple schools\n'
                '- Add student profiles with detailed information\n'
                '- Easily search and filter through students\n'
                '- View and edit student records\n'
                '- Track attendance and other school data\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Why Use This App?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'This app is designed to make school administration simpler and more effective. With easy data entry and management, it reduces paperwork and improves the accessibility of student information. The user-friendly interface allows administrators to focus on what really matters: providing a great educational experience for their students.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Developer Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Developed by XYZ Solutions\n'
                'For support, contact: support@xyz.com\n'
                'App Version: 1.0.0',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  '"Simplifying school management for a better tomorrow!"',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
