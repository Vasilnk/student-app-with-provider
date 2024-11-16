import 'package:flutter/material.dart';
import 'package:student_app/database/db_functions.dart';
import 'package:student_app/database/db_model.dart';
import 'package:student_app/screens/edit_page.dart';
import 'package:student_app/screens/student_profile.dart';

class GridViewBuilder extends StatefulWidget {
  final List<StudentDBModel> students;
  const GridViewBuilder(this.students, {super.key});

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  @override
  Widget build(BuildContext context) {
    final students = widget.students;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1,
      ),
      itemCount: students.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        final student = students[index];

        return Container(
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(student)),
              );
            },
            child: GridTile(
              header: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: student.image != null
                        ? MemoryImage(student.image!)
                        : null,
                    child:
                        student.image == null ? const Icon(Icons.person) : null,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    student.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Class: ${student.classNumber}'),
                ],
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Choose an action'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                child: const ListTile(
                                  leading: Icon(Icons.edit, color: Colors.blue),
                                  title: Text('Edit'),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) =>
                                          EditStudentPage(student: student),
                                    ),
                                  );
                                },
                              ),
                              const Divider(),
                              InkWell(
                                child: const ListTile(
                                  leading:
                                      Icon(Icons.delete, color: Colors.red),
                                  title: Text('Delete'),
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        title: const Text('Confirm Delete'),
                                        content: const Text(
                                            'Are you sure you want to delete this student?'),
                                        actions: [
                                          TextButton(
                                            child: const Text('No'),
                                            onPressed: () {
                                              Navigator.of(ctx).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Yes'),
                                            onPressed: () {
                                              if (student.id != null) {
                                                deleteStudent(student.id!);
                                                Navigator.of(ctx).pop();
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
