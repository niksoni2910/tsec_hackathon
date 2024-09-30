import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:tsec_hack/screens/bnav.dart';
import 'package:tsec_hack/screens/recent_alert_list.dart';
import 'package:tsec_hack/screens/transaction_page.dart';
=======
import 'package:tsec_hack/profile_page.dart';
import 'package:tsec_hack/screens/bnav.dart';
>>>>>>> 32bba3edb2cb5b64683b2a641c2337758c2d70c8

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBar(),
    );
  }
}
