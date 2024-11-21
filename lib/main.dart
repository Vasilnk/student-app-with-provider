import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_app/database/db_model.dart';
import 'package:student_app/providers/login_provider.dart';
import 'package:student_app/providers/students_provider.dart';
import 'package:student_app/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentDBModelAdapter().typeId)) {
    Hive.registerAdapter(StudentDBModelAdapter());
  }
  await Hive.openBox<StudentDBModel>('students');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => StudentsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Color.fromARGB(255, 81, 112, 105),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color.fromARGB(255, 46, 42, 42)),
        )),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
