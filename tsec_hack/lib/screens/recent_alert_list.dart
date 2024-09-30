import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsec_hack/screens/transaction_page.dart';

class RecentAlertsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Recent Alerts'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildRecentAlerts(context),
      ),
    );
  }

  Widget _buildRecentAlerts(BuildContext context) {
    return ListView(
      children: [
        _buildAlertCard('Transaction ID: #12345', 'High Risk',
            DateTime(2024, 6, 6), Colors.redAccent,context),
        const SizedBox(height: 10),
        _buildAlertCard('Transaction ID: #67890', 'Low Risk',
            DateTime(2023, 12, 6), Colors.orangeAccent,context),
        const SizedBox(height: 10),
        _buildAlertCard('Transaction ID: #54321', 'High Risk',
            DateTime(2023, 6, 6), Colors.redAccent,context),
        const SizedBox(height: 10),
        _buildAlertCard('Transaction ID: #11223', 'Medium Risk',
            DateTime(2023, 8, 15), Colors.yellowAccent,context),
        const SizedBox(height: 10),
        _buildAlertCard('Transaction ID: #99887', 'Low Risk',
            DateTime(2024, 1, 1), Colors.orangeAccent,context),
      ],
    );
  }

  Widget _buildAlertCard(
    String title,
    String description,
    DateTime date,
    Color color,
    BuildContext context
  ) {
    String formattedDate = DateFormat('MMM d, yyyy').format(date);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.warning, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          "$description - $formattedDate",
          style: const TextStyle(color: Colors.black54),
        ),
        trailing: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionPage(
                    payeeName: 'Alice',
                    payerName: 'Bob',
                    amount: 100.0,
                    date: '2024-09-30',
                    time: '12:00 PM',
                    payerBankAccountNumber: '1234 5678 9012 3456',
                    payeeBankAccountNumber: '6543 2109 8765 4321',
                    category: 'green',
                  ),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.blue)),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecentAlertsPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
