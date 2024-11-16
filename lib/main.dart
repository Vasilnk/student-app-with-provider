import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_app/database/db_model.dart';
import 'package:student_app/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentDBModelAdapter().typeId)) {
    Hive.registerAdapter(StudentDBModelAdapter());
  }
  await Hive.openBox<StudentDBModel>('students');
  // await Hive.openBox<Uint8List>('image');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        // centerTitle: true,

        color: Color.fromARGB(255, 81, 112, 105),
        // color: Color.fromARGB(255, 226, 224, 224),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 46, 42, 42)),
      )),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
