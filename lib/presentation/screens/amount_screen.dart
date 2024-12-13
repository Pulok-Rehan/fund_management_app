import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appColor.dart';
import 'otp_screen.dart';

class AmountPage extends StatelessWidget {
  final String transactionType;

  AmountPage({required this.transactionType});

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          transactionType,
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cardColorSecondary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "You are about to perform a $transactionType transaction. Please enter the amount below.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.cardColorSecondary,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: amountController,
                  decoration: InputDecoration(
                    labelText: "Enter Amount",
                    labelStyle: TextStyle(color: AppColors.buttonColor),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.buttonColor),
                    ),
                    prefixIcon: Icon(Icons.money, color: AppColors.buttonColor),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: AppColors.buttonColor),
                ),
                SizedBox(height: 20),
                Text(
                  "Quick Amounts",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cardColorSecondary,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [100, 500, 1000, 5000, 10000].map((amount) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.primaryColor,
                        backgroundColor: AppColors.buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        amountController.text = amount.toString();
                      },
                      child: Text("$amount TK"),
                    );
                  }).toList(),
                ),
                SizedBox(height: 30),
                Divider(color: AppColors.cardColorPrimary),
                SizedBox(height: 10),
                SizedBox(height: 10),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  ),
                  onPressed: () {
                    if (amountController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpPage()),
                      );
                    }
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}