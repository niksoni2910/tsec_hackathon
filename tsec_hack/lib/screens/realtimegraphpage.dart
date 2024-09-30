import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async'; // For simulating real-time data updates

class RealTimeGraphsPage extends StatefulWidget {
  const RealTimeGraphsPage({super.key});

  @override
  State<RealTimeGraphsPage> createState() => _RealTimeGraphsPageState();
}

class _RealTimeGraphsPageState extends State<RealTimeGraphsPage> {
  List<FlSpot> transactionSpots = [];
  List<FlSpot> flaggedSpots = [];
  List<FlSpot> highRiskSpots = [];
  int currentTime = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
        const Duration(seconds: 1), _updateData); // Simulate real-time updates
  }

  void _updateData(Timer timer) {
    setState(() {
      currentTime++;
      // Add new random data points for each graph every second
      transactionSpots.add(
          FlSpot(currentTime.toDouble(), (5 + (currentTime % 10)).toDouble()));
      flaggedSpots.add(
          FlSpot(currentTime.toDouble(), (1 + (currentTime % 5)).toDouble()));
      highRiskSpots.add(
          FlSpot(currentTime.toDouble(), (0.5 + (currentTime % 2)).toDouble()));

      if (transactionSpots.length > 10) {
        transactionSpots
            .removeAt(0); // Remove oldest data point for real-time effect
      }
      if (flaggedSpots.length > 10) flaggedSpots.removeAt(0);
      if (highRiskSpots.length > 10) highRiskSpots.removeAt(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F8),
      appBar: AppBar(
        title: const Text('Real-Time Graphs'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildChartCard('Transaction Volume (Real-Time)',
                  _buildTransactionChart(), Colors.blueAccent),
              const SizedBox(height: 20),
              _buildChartCard('Flagged Activities (Real-Time)',
                  _buildFlaggedChart(), Colors.orange),
              const SizedBox(height: 20),
              _buildChartCard('High-Risk Transactions (Real-Time)',
                  _buildHighRiskChart(), Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable widget for each chart card
  Widget _buildChartCard(String title, Widget chart, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 10),
            Expanded(child: chart),
          ],
        ),
      ),
    );
  }

  // Chart for Transaction Volume
  Widget _buildTransactionChart() {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          leftTitles:
              AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles:  AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.blueAccent,
            spots: transactionSpots,
          ),
        ],
      ),
    );
  }

  // Chart for Flagged Activities
  Widget _buildFlaggedChart() {
    return LineChart(LineChartData(
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          color: Colors.orange,
          spots: flaggedSpots,
        ),
      ],
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true)),
        bottomTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
      ),
    ));
  }

  // Chart for High-Risk Transactions
  Widget _buildHighRiskChart() {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          leftTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.red,
            spots: highRiskSpots,
          ),
        ],
      ),
    );
  }
}
