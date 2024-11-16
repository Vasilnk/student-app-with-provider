import 'package:flutter/material.dart';
import 'package:student_app/database/db_model.dart';

class ProfilePage extends StatelessWidget {
  final StudentDBModel student;

  const ProfilePage(this.student, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> details = [
      student.name,
      student.age,
      student.classNumber,
      student.division,
      student.guardian,
      student.contact
    ];

    const List<String> title = [
      'Name',
      'Age',
      'Class',
      'Division',
      'Guardian',
      'Phone'
    ];

    const titleStyle = TextStyle(
      fontSize: 18,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
    );

    const detailStyle = TextStyle(
      fontSize: 18,
      color: Colors.black54,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 226, 224, 224)),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: student.image != null
                      ? MemoryImage(student.image!)
                      : null,
                  child: student.image == null
                      ? const Icon(Icons.person,
                          size: 80, color: Colors.white70)
                      : null,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < title.length; i++) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(title[i], style: titleStyle),
                              Text(details[i], style: detailStyle),
                            ],
                          ),
                          if (i < title.length - 1)
                            const Divider(
                              color: Colors.grey,
                              height: 30,
                              thickness: 1,
                            ),
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
