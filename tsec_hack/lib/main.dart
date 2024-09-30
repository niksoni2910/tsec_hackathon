import 'package:flutter/material.dart';
import 'package:tsec_hack/screens/bnav.dart';
import 'package:tsec_hack/screens/recent_alert_list.dart';
import 'package:tsec_hack/screens/transaction_page.dart';

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
    //   home: TransactionPage(
    //   payeeName: 'Alice',
    //   payerName: 'Bob',
    //   amount: 100.0,
    //   date: '2024-09-30',
    //   time: '12:00 PM',
    //   payerBankAccountNumber: '1234 5678 9012 3456',
    //   payeeBankAccountNumber: '6543 2109 8765 4321',
    //   category: 'green',
    // ),
    home: BottomNavBar(),
    );
  }
}

