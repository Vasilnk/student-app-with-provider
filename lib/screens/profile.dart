import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchoolProfileScreen extends StatefulWidget {
  const SchoolProfileScreen({super.key});

  @override
  _SchoolProfileScreenState createState() => _SchoolProfileScreenState();
}

class _SchoolProfileScreenState extends State<SchoolProfileScreen> {
  String? schoolId;
  String? schoolName;
  final List<String> title = ['School ID', 'School Name'];
  late List<String> details;

  @override
  void initState() {
    super.initState();
    _loadSchoolData();
  }

  void _loadSchoolData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      schoolId = prefs.getString('schoolId') ?? 'N/A';
      schoolName = prefs.getString('schoolName') ?? 'N/A';
      details = [schoolId!, schoolName!];
    });
  }

  final TextStyle titleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  final TextStyle detailStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 226, 224, 224),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/school.jpeg'),
                  child: null,
                ),
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    height: 200,
                    width: 400,
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
                        ],
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
