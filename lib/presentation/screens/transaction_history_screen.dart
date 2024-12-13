import 'package:flutter/material.dart';

import '../widgets/appColor.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> transactions = [
      {
        'title': 'Daraz.com',
        'date': 'Dec 29, 2024',
        'amount': '-100.00 TK',
        'type': 'debit',
      },
      {
        'title': 'Salary of December',
        'date': 'Dec 1, 2024',
        'amount': '+1,500.00 TK',
        'type': 'credit',
      },
      {
        'title': 'To A/C No. 101201230252',
        'date': 'Dec 9, 2024',
        'amount': '-1000.00 TK',
        'type': 'debit',
      },
      {
        'title': 'To A/C No. 101201230123',
        'date': 'Nov 8, 2024',
        'amount': '+8500.00 TK',
        'type': 'credit',
      },
      {
        'title': 'To A/C No. 101201230122',
        'date': 'Nov 1, 2024',
        'amount': '-1500.00 TK',
        'type': 'debit',
      },
      {
        'title': 'To A/C No. 101201653252',
        'date': 'Oct 28, 2024',
        'amount': '+2500.00 TK',
        'type': 'credit',
      },
      {
        'title': 'To A/C No. 101201230262',
        'date': 'Oct 15, 2024',
        'amount': '-8500.00 TK',
        'type': 'debit',
      },
      {
        'title': 'To A/C No. 101201230352',
        'date': 'Oct 8, 2024',
        'amount': '+3500.00 TK',
        'type': 'credit',
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final isCredit = transaction['type'] == 'credit';

            return Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isCredit ? AppColors.cardColorPrimary : AppColors.buttonColor,
                  child: Icon(
                    isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                    color: AppColors.primaryColor,
                  ),
                ),
                title: Text(
                  transaction['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor
                  ),
                ),
                subtitle: Text(transaction['date'], style: TextStyle(color: AppColors.buttonColor)),
                trailing: Text(
                  transaction['amount'],
                  style: TextStyle(
                    color: isCredit ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}