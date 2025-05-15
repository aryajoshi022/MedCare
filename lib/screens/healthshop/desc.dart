import 'package:flutter/material.dart';
class MedicationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Medication Name'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Details'),
              Tab(text: 'Reviews'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Description Tab
          ],
        ),
      ),
    );
  }
}

class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Active Ingredients:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '• Acetaminophen (500 mg)\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '• Ibuprofen (200 mg)\n',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: '• Caffeine (50 mg)\n',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Dosage Information:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            '• Adults: Take 1 tablet every 4 to 6 hours as needed. '
                'Do not exceed 4 tablets in 24 hours.\n'
                '• Children (ages 6-12): Take half a tablet every 4 to 6 hours as needed. '
                'Do not exceed 2 tablets in 24 hours.\n'
                '• Children under 6 years: Consult a healthcare professional before use.',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 16),
          Text(
            'Storage Information:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'For optimal potency and safety, it is recommended to store this medication '
                'in a cool, dry place, away from direct sunlight. '
                'Exposure to excessive heat or moisture may compromise the quality of the product.',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}