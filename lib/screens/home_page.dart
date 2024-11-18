// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:student_app/database/db_functions.dart';
// import 'package:student_app/database/db_model.dart';
// import 'package:student_app/providers/students_provider.dart';
// import 'package:student_app/screens/add_page.dart';
// import 'package:student_app/screens/drower_screen.dart';
// import 'package:student_app/screens/grid_view.dart';
// import 'package:student_app/screens/list_view.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   bool isGridView = false;
//   TextEditingController searchController = TextEditingController();
//   List<StudentDBModel> filteredStudents = [];
//   // String schoolName = '';

//   @override
//   void initState() {
//     super.initState();
//     getStudents();
//     searchController.addListener(_filterStudents);
//   }

//   @override
//   void dispose() {
//     searchController.removeListener(_filterStudents);
//     searchController.dispose();
//     super.dispose();
//   }

//   void _filterStudents() {
//     final query = searchController.text.toLowerCase();
//     setState(() {
//       filteredStudents = studentListNotifier.value
//           .where((student) => student.name.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("Biuld method is calling");
//     return Scaffold(
//       drawer: DrowerScreen(),
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           'Home',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: Icon(
//               isGridView
//                   ? Icons.grid_view
//                   : Icons.format_list_bulleted_outlined,
//               size: 30,
//             ),
//             onPressed: () {
//               setState(() {
//                 isGridView = !isGridView;
//               });
//             },
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               decoration: const InputDecoration(
//                 hintText: 'Search',
//                 prefixIcon: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
//                   child: Icon(Icons.search),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(

//             child: ValueListenableBuilder(
//               valueListenable: studentListNotifier,
//               builder: (context, value, child) {
//                 print('inside value listenable builder');
//                 // builder: (context, StudentProvider studentProvider, child) {
//                 //   final students = studentProvider.students;
//                 if (searchController.text.isEmpty) {
//                   filteredStudents = studentListNotifier.value;
//                 }
//                 if (studentListNotifier.value.isEmpty) {
//                   return const Center(
//                     child: Center(
//                         child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.school,
//                           size: 150,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'No students added',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ],
//                     )),
//                   );
//                 } else {
//                   final providerInstance =
//                       Provider.of<StudentsProvider>(context);
//                   final filteredStudents = providerInstance.students;
//                   return isGridView
//                       ? GridViewBuilder(filteredStudents)
//                       : ListViewBuilder(filteredStudents);
//                 }
//               },
//             ),

//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const AddStudentPage(),
//             ),
//           );
//         },
//         label: const Text(
//           'Add',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color.fromARGB(255, 81, 112, 105),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/providers/students_provider.dart';
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
  final TextEditingController searchController = TextEditingController();
  bool isGridView = false;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final studentsProvider = Provider.of<StudentsProvider>(context);
    final allStudents = studentsProvider.students;
    final filteredStudents = searchController.text.isEmpty
        ? allStudents
        : allStudents
            .where((student) => student.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();

    return Scaffold(
      key: scaffoldKey,
      drawer: DrowerScreen(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isGridView
                ? Icons.grid_view
                : Icons.format_list_bulleted_outlined),
            onPressed: () => setState(() {
              isGridView = !isGridView;
            }),
          ),
        ],
      ),
      body: Column(
        children: [
          searchBar(),
          Expanded(
            child: filteredStudents.isEmpty
                ? noStudents()
                : isGridView
                    ? GridViewBuilder(filteredStudents)
                    : ListViewBuilder(filteredStudents),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddStudentPage()),
          );
        },
        label: const Text('Add', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 81, 112, 105),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
        ),
      ),
    );
  }

  noStudents() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school, size: 150, color: Colors.grey),
          SizedBox(height: 10),
          Text(
            'No students added',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
