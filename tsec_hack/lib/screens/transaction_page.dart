import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final String payeeName;
  final String payerName;
  final double amount;
  final String date;
  final String time;
  final String payerBankAccountNumber;
  final String payeeBankAccountNumber;
  final String category; // 'red', 'yellow', or 'green'

  const TransactionPage({
    required this.payeeName,
    required this.payerName,
    required this.amount,
    required this.date,
    required this.time,
    required this.payerBankAccountNumber,
    required this.payeeBankAccountNumber,
    required this.category,
  });

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
        title: Text('Transaction Details'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[50]!, Colors.blue[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: _buildTransactionCard(),
        ),
      ),
    );
  }

  Widget _buildTransactionCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryIndicator(category),
            SizedBox(height: 20),
            _buildCardInfoRow(icon: Icons.person, title: 'Payee Name', value: payeeName, color: Colors.orange),
            _buildCardInfoRow(icon: Icons.person, title: 'Payer Name', value: payerName, color: Colors.blue),
            _buildCardInfoRow(icon: Icons.attach_money, title: 'Amount', value: '\$${amount.toStringAsFixed(2)}', color: Colors.green),
            _buildCardInfoRow(icon: Icons.date_range, title: 'Date', value: date, color: Colors.purple),
            _buildCardInfoRow(icon: Icons.access_time, title: 'Time', value: time, color: Colors.indigo),
            _buildCardInfoRow(icon: Icons.account_balance, title: 'Payer Bank Account', value: payerBankAccountNumber, color: Colors.teal),
            _buildCardInfoRow(icon: Icons.account_balance_wallet, title: 'Payee Bank Account', value: payeeBankAccountNumber, color: Colors.cyan),
            
          ],
        ),
      ),
    );
  }

  Widget _buildCardInfoRow({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIndicator(String category) {
    Color categoryColor;
    String categoryLabel;

    switch (category.toLowerCase()) {
      case 'red':
        categoryColor = Colors.red;
        categoryLabel = 'High Risk';
        break;
      case 'yellow':
        categoryColor = Colors.yellow;
        categoryLabel = 'Medium Risk';
        break;
      case 'green':
        categoryColor = Colors.green;
        categoryLabel = 'Low Risk';
        break;
      default:
        categoryColor = Colors.grey;
        categoryLabel = 'Unknown';
        break;
    }

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: categoryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: categoryColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning,
            color: categoryColor,
          ),
          SizedBox(width: 10),
          Text(
            'Category: $categoryLabel',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: categoryColor,
            ),
          ),
        ],
      ),
    );
  }
}
