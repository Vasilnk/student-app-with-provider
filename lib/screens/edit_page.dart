import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_app/database/db_functions.dart';
import 'package:student_app/database/db_model.dart';

class EditStudentPage extends StatefulWidget {
  final StudentDBModel student;

  const EditStudentPage({super.key, required this.student});

  @override
  _EditStudentPageState createState() => _EditStudentPageState();
}

class _EditStudentPageState extends State<EditStudentPage> {
  final inputName = TextEditingController();
  final inputAge = TextEditingController();
  final inputGuardian = TextEditingController();
  final inputContact = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? classNumber;
  String? division;
  Uint8List? imageData;
  final ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    inputName.text = widget.student.name;
    inputAge.text = widget.student.age;
    inputGuardian.text = widget.student.guardian;
    inputContact.text = widget.student.contact;
    imageData = widget.student.image;
    classNumber = widget.student.classNumber;
    division = widget.student.division;
  }

  Future<void> _pickImage() async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (image != null) {
      final File imageFile = File(image.path);
      imageData = await imageFile.readAsBytes();
    }
  }

  Future<void> updateStudentButtonClicked() async {
    final name = inputName.text.trim();
    final age = inputAge.text.trim();
    final guardian = inputGuardian.text.trim();
    final contact = inputContact.text.trim();
    if (name.isNotEmpty &&
        age.isNotEmpty &&
        guardian.isNotEmpty &&
        contact.isNotEmpty &&
        classNumber!.isNotEmpty) {
      final updatedStudent = StudentDBModel(
        classNumber: classNumber!,
        division: division!,
        id: widget.student.id,
        name: name,
        age: age,
        guardian: guardian,
        contact: contact,
        image: imageData,
      );

      try {
        await updateStudent(updatedStudent);
        Navigator.of(context).pop();
      } catch (e) {
        print("Error updating student: $e");
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Failed to update student. Please try again.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                InkWell(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        imageData != null ? MemoryImage(imageData!) : null,
                    child: imageData == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: inputName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Enter name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: inputAge,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Age',
                          hintText: 'Enter age',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Age required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              hint: Text(classNumber!),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.all(10)),
                              items: [
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
                              ].map((String classValue) {
                                return DropdownMenuItem<String>(
                                  value: classValue,
                                  child: Text(classValue),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  if (value != null) {
                                    classNumber = value;
                                  }
                                });
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                            ),
                          ),
                          const SizedBox(
                            width: 90,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: 40,
                              child: DropdownButtonFormField<String>(
                                hint: Text(division!),
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(8)),
                                items: [
                                  'A',
                                  'B',
                                  'C',
                                  'D',
                                  'E',
                                  'F',
                                  'G',
                                  'H',
                                  'I',
                                  'J',
                                  'K',
                                ].map((String division) {
                                  return DropdownMenuItem<String>(
                                    value: division,
                                    child: Text(division),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    if (value != null) {
                                      division = value;
                                    }
                                  });
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: inputGuardian,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Guardian name',
                          hintText: 'Enter guardian name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Guardian name required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: inputContact,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone number',
                          hintText: 'Phone number',
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone number required';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                updateStudentButtonClicked();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.green),
                            ),
                            child: const Text('Update'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              clear();
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.red),
                            ),
                            child: const Text('Clear'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clear() {
    inputName.clear();
    inputAge.clear();
    inputGuardian.clear();
    inputContact.clear();
    setState(() {
      imageData = null;
    });
  }
}
