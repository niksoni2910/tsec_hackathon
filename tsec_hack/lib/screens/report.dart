import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class ReportGenerationPage extends StatefulWidget {
  @override
  _ReportGenerationPageState createState() => _ReportGenerationPageState();
}

class _ReportGenerationPageState extends State<ReportGenerationPage> {
  bool _isLoading = false;
  bool _isReportGenerated = false;

  void _generateReport() {
    setState(() {
      _isLoading = true;
      _isReportGenerated = false;
    });

    // Simulating report generation delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        _isReportGenerated = true;
      });
    });
  }

  // Dummy Report Data as a string
  String _generateDummyReportText() {
    return """
    Financial Institute Compliance Report
    ------------------------------------
    
    Report Date: ${DateTime.now().toString()}
    
    1. Institute Name: XYZ Financial Institution
    2. Total Transactions: 1523
    3. Total Suspicious Transactions: 23
    4. Risk Scores: High-Risk Transactions: 15%, Medium-Risk: 30%, Low-Risk: 55%
    
    Suspicious Activity Details:
    - Account 123456: \$15000 transferred to offshore account. Flagged as high risk.
    - Account 654321: Multiple small deposits within 24 hours. Flagged as medium risk.
    
    Overall Report:
    - No serious regulatory issues detected, but monitoring of certain high-risk transactions is advised.
    """;
  }

  // Generate a PDF report for downloading
  Future<void> _downloadReport() async {
    // Get the app-specific documents directory
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) => pw.Center(
            child: pw.Text(_generateDummyReportText()),
          ),
        ),
      );

      // Get the app-specific directory to store the PDF (works for Android 10+)
      final outputDir = await getApplicationDocumentsDirectory();
      final outputFile = File(
          "${outputDir.path}/financial_report_${DateTime.now().millisecondsSinceEpoch}.pdf");

      // Write the file to the app-specific storage
      await outputFile.writeAsBytes(await pdf.save());

      // Show a success message with file path
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Report downloaded to ${outputFile.path}")),
      );
    } catch (e) {
      print("Error while saving the file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error saving report")),
      );
    }
  }

  // Show the report in a simple dialog
  void _viewReport() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Generated Report"),
          content: SingleChildScrollView(
            child: Text(_generateDummyReportText()),
          ),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Generation"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Generate Compliance Report",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            _isLoading
                ? CircularProgressIndicator()
                : _isReportGenerated
                    ? Column(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 50,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Report generated successfully!",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: _viewReport,
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("View Report"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: _downloadReport,
                            icon: Icon(Icons.download),
                            label: Text("Download Report"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              textStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    : ElevatedButton.icon(
                        onPressed: _generateReport,
                        icon: Icon(Icons.assessment),
                        label: Text("Generate Report"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
            SizedBox(height: 30),
            Text(
              _isLoading
                  ? "Generating report, please wait..."
                  : _isReportGenerated
                      ? "You can view or download your report."
                      : "Press the button to generate a compliance report.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
