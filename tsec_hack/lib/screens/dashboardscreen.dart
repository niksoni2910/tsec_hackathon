import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tsec_hack/screens/transaction_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F8),
      appBar: AppBar(
        title: const Text('AI Transaction Dashboard'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildMetricCards(),
            // const SizedBox(height: 20),
            // _buildTransactionChart(),
            const SizedBox(height: 20),
            _buildRecentAlerts(),
          ],
        ),
      ),
    );
  }

  // Widget for metrics cards
  Widget _buildMetricCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildMetricCard(
            'Total Transactions', '1,250', Icons.swap_horiz, const Color(0xFF2196F3)),
        _buildMetricCard('Flagged Activities', '12', Icons.flag, const Color(0xFFF44336)),
        _buildMetricCard(
            'High-Risk Transactions', '3', Icons.warning, const Color(0xFFFF9800)),
      ],
    );
  }

  // Reusable widget for a single metric card
  Widget _buildMetricCard(
      String title, String count, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 110,
        height: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 10),
            Text(
              count,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for displaying a chart
  Widget _buildTransactionChart() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transaction Patterns (Last 16 Days)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(
                    leftTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: true)),
                    bottomTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.blueAccent,
                      spots: [
                        const FlSpot(1, 1),
                        const FlSpot(3, 1.5),
                        const FlSpot(5, 1.8),
                        const FlSpot(7, 2.1),
                        const FlSpot(9, 2.5),
                        const FlSpot(11, 2.8),
                        const FlSpot(13, 3.2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for recent alerts
  Widget _buildRecentAlerts() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Alerts',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildAlertTile('Transaction ID: #12345', 'High Risk',
                DateTime(2024, 6, 6), Colors.red),
            _buildAlertTile('Transaction ID: #67890', 'Low Risk',
                DateTime(2023, 12, 6), Colors.orange),
            _buildAlertTile('Transaction ID: #54321', 'High Risk',
                DateTime(2023, 6, 6), Colors.red),
          ],
        ),
      ),
    );
  }

  // Reusable widget for a single alert tile
  Widget _buildAlertTile(
      String title, String description, DateTime date, Color color) {
        String formattedDate = DateFormat('MMM d, yyyy').format(date);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: const Icon(Icons.warning, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("$description $formattedDate"),
      trailing: IconButton(icon:Icon(Icons.arrow_forward_ios), onPressed:()=>{ Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TransactionPage(
                    payeeName: 'Alice',
                    payerName: 'Bob',
                    amount: 100.0,
                    date: '2024-09-30',
                    time: '12:00 PM',
                    payerBankAccountNumber: '1234 5678 9012 3456',
                    payeeBankAccountNumber: '6543 2109 8765 4321',
                    category: description == "High Risk" ? "red": description == "Low Risk"?"yellow":"green",
                  ),
                ),)}),
    );
  }
}
