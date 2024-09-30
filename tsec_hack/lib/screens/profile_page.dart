import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  // Mock data for the user's transactions
  final String userName = "John Doe";
  final int totalTransactions = 150;
  final double totalAmount = 25000.00;
  final int nonFraudTransactions = 140;
  final int fraudTransactions = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("AML Profile Summary"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildCardInfo(
              icon: Icons.list_alt,
              title: 'Total Transactions',
              value: totalTransactions.toString(),
              color: Colors.orange,
            ),
            //   Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Table(
            //     border: TableBorder.all(
            //       color: Colors.black,
            //       width: 1,
            //     ),
            //     children: [
            //       TableRow(
            //         children: [
            //           _buildTableCell('GREEN', Colors.green),
            //           _buildTableCell('YELLOW', Colors.yellow),
            //           _buildTableCell('RED', Colors.red),
            //         ],
            //       ),
            //       TableRow(
            //         children: [
            //           _buildValueCell('75'),
            //           _buildValueCell('25'),
            //           _buildValueCell('50'),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TransactionBar(
                greenCount: 75,
                yellowCount: 25,
                redCount: 50,
                totalCount: 150,
              ),
            ),

            _buildCardInfo(
              icon: Icons.attach_money,
              title: 'Total Amount',
              value: '\$${totalAmount.toStringAsFixed(2)}',
              color: Colors.green,
            ),
            _buildCardInfo(
              icon: Icons.check_circle,
              title: 'Non-Fraud Transactions',
              value: nonFraudTransactions.toString(),
              color: Colors.blue,
            ),
            _buildCardInfo(
              icon: Icons.warning,
              title: 'Fraud Transactions',
              value: fraudTransactions.toString(),
              color: Colors.red,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blueAccent, // Button color according to theme
                ),
                onPressed: () {
                  // Action for viewing all transactions
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AllTransactionsPage(),
                  //   ),
                  // );
                },
                child: Text(
                  'View All Transactions',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 40, color: Colors.blueAccent),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardInfo({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
  // Widget _buildTableCell(String label, Color color) {
  //   return Container(
  //     padding: EdgeInsets.all(12),
  //     color: color.withOpacity(0.3),
  //     child: Center(
  //       child: Text(
  //         label,
  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildValueCell(String value) {
  //   return Container(
  //     padding: EdgeInsets.all(12),
  //     child: Center(
  //       child: Text(
  //         value,
  //         style: TextStyle(fontSize: 18),
  //       ),
  //     ),
  //   );
  // }
}

class TransactionBar extends StatelessWidget {
  final int greenCount;
  final int yellowCount;
  final int redCount;
  final int totalCount;

  const TransactionBar({
    required this.greenCount,
    required this.yellowCount,
    required this.redCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate percentages based on counts
    final double greenPercentage = greenCount / totalCount;
    final double yellowPercentage = yellowCount / totalCount;
    final double redPercentage = redCount / totalCount;

    return Column(
      children: [
        Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Flexible(
                flex: (greenPercentage * 100).toInt(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      greenCount.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: (yellowPercentage * 100).toInt(),
                child: Container(
                  color: Colors.yellow,
                  child: Center(
                    child: Text(
                      yellowCount.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: (redPercentage * 100).toInt(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      redCount.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
