import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/providers/login_provider.dart';
import 'package:student_app/screens/logout.dart';
import 'package:student_app/utils.dart';

class DrowerScreen extends StatelessWidget {
  DrowerScreen({
    super.key,
  });

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: scaffoldKey,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/school.jpeg'),
                  ),
                  const SizedBox(height: 20),
                  Consumer(
                    builder: (BuildContext context, LoginProvider value,
                        Widget? child) {
                      return Text(
                        value.schoolName ?? 'No name added',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final item = Utils.sidePanelItems[index];
                  return ListTile(
                    leading: Icon(item['icon']),
                    title: Text(item['title']),
                    onTap: () {
                      if (index == 1) {
                        logoutFunction(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => item['screen'],
                          ),
                        );
                      }
                    },
                  );
                },
                itemCount: Utils.sidePanelItems.length,
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
