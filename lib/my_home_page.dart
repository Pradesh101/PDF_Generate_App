import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'models/invoice_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final invoices = [
  Invoice(
      customer: 'David Thomas',
      address: '123 Fake St\r\nBermuda Triangle',
      items: [
        LineItem(
          description: 'Technical Engagement',
          cost: 120,
        ),
        LineItem(description: 'Deployment Assistance', cost: 200),
        LineItem(description: 'Develop Software Solution', cost: 3020.45),
        LineItem(description: 'Produce Documentation', cost: 840.50),
      ],
      name: 'Create and deploy software package'),
  Invoice(
    customer: 'Michael Ambiguous',
    address: '82 Unsure St\r\nBaggle Palace',
    items: [
      LineItem(description: 'Professional Advice', cost: 100),
      LineItem(description: 'Lunch Bill', cost: 43.55),
      LineItem(description: 'Remote Assistance', cost: 50),
    ],
    name: 'Provide remote support after lunch',
  ),
  Invoice(
    customer: 'Marty McDanceFace',
    address: '55 Dancing Parade\r\nDance Place',
    items: [
      LineItem(description: 'Program the robots', cost: 400.50),
      LineItem(
          description: 'Find tasteful dance moves for the robots', cost: 80.55),
      LineItem(description: 'General quality assurance', cost: 80),
    ],
    name: 'Create software to teach robots how to dance',
  )
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
      ),
      body: ListView(
        children: [
          ...invoices.map(
            (e) => ListTile(
              title: Text(e.name),
              subtitle: Text(e.customer),
              trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => DetailPage(invoice: e),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
