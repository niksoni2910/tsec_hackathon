import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RealTimeGraphsPage extends StatelessWidget {
  const RealTimeGraphsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F8),
      appBar: AppBar(
        title: const Text('AML Dashboard'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildChartCard('Transaction Volume', _buildTransactionChart(),
                  Colors.blueAccent),
              const SizedBox(height: 20),
              _buildChartCard(
                  'Flagged Activities', _buildFlaggedChart(), Colors.orange),
              const SizedBox(height: 20),
              _buildChartCard(
                  'High-Risk Transactions', _buildHighRiskChart(), Colors.red),
              const SizedBox(height: 20),
              _buildChartCard('True vs False Positive',
                  _buildTrueFalsePositiveChart(), Colors.green),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget _buildTransactionChart() {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
            show: true, border: Border.all(color: Colors.grey, width: 1)),
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.blueAccent,
            spots: [
              const FlSpot(0, 5),
              const FlSpot(1, 7),
              const FlSpot(2, 6),
              const FlSpot(3, 8),
              const FlSpot(4, 9),
              const FlSpot(5, 11),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFlaggedChart() {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
            show: true, border: Border.all(color: Colors.grey, width: 1)),
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.orange,
            spots: [
              const FlSpot(0, 2),
              const FlSpot(1, 3),
              const FlSpot(2, 2),
              const FlSpot(3, 4),
              const FlSpot(4, 3),
              const FlSpot(5, 5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHighRiskChart() {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(
            show: true, border: Border.all(color: Colors.grey, width: 1)),
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            color: Colors.red,
            spots: [
              const FlSpot(0, 1),
              const FlSpot(1, 1.5),
              const FlSpot(2, 1),
              const FlSpot(3, 2),
              const FlSpot(4, 1.5),
              const FlSpot(5, 2.5),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrueFalsePositiveChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        barTouchData: BarTouchData(enabled: false),
        titlesData: const FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
              reservedSize: 30,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 20,
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          _makeGroupData(0, 70, 30),
          _makeGroupData(1, 60, 40),
          _makeGroupData(2, 75, 25),
          _makeGroupData(3, 65, 35),
          _makeGroupData(4, 80, 20),
          _makeGroupData(5, 72, 28),
        ],
      ),
    );
  }

  static BarChartGroupData _makeGroupData(
      int x, double truePositive, double falsePositive) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: truePositive,
          color: Colors.green,
          width: 15,
        ),
        BarChartRodData(
          toY: falsePositive,
          color: Colors.red,
          width: 15,
        ),
      ],
    );
  }

  static Widget getBottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}
