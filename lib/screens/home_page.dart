import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_app/database/db_functions.dart';
import 'package:student_app/database/db_model.dart';
import 'package:student_app/screens/add_page.dart';
import 'package:student_app/screens/drower_screen.dart';
import 'package:student_app/screens/grid_view.dart';
import 'package:student_app/screens/list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isGridView = false;
  TextEditingController searchController = TextEditingController();
  List<StudentDBModel> filteredStudents = [];
  String schoolName = '';

  @override
  void initState() {
    super.initState();
    getStudents();
    searchController.addListener(_filterStudents);
    get();
  }

  @override
  void dispose() {
    searchController.removeListener(_filterStudents);
    searchController.dispose();
    super.dispose();
  }

  get() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    final school = sharedPreference.get('schoolName');
    setState(() {
      schoolName = school.toString();
    });
  }

  void _filterStudents() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredStudents = studentListNotifier.value
          .where((student) => student.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrowerScreen(schoolName: schoolName),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              isGridView
                  ? Icons.grid_view
                  : Icons.format_list_bulleted_outlined,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                  child: Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<StudentDBModel>>(
              valueListenable: studentListNotifier,
              builder: (context, students, child) {
                if (searchController.text.isEmpty) {
                  filteredStudents = students;
                }
                if (filteredStudents.isEmpty) {
                  return const Center(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.school,
                          size: 150,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'No students added',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )),
                  );
                }

                return isGridView
                    ? GridViewBuilder(filteredStudents)
                    : ListViewBuilder(filteredStudents);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddStudentPage(),
            ),
          );
        },
        label: const Text(
          'Add',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 81, 112, 105),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
