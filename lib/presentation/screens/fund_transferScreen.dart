import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appColor.dart';
import 'otp_screen.dart';

class FundTransferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    String fromAccount = "";
    String toAccount = "";
    String channel = "";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fund Transfer",
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
                Text(
                  "Transfer Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cardColorSecondary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Fill in the details below to transfer funds.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.cardColorSecondary,
                  ),
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: fromAccount.isNotEmpty ? fromAccount : null,
                  items: ["Pulok Rehan - 1010112345"].map((account) {
                    return DropdownMenuItem(
                      value: account,
                      child: Text(account),
                    );
                  }).toList(),
                  onChanged: (value) {
                    fromAccount = value ?? "";
                  },
                  decoration: InputDecoration(
                    labelText: "From Account",
                    labelStyle: TextStyle(color: AppColors.buttonColor),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.buttonColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: toAccount.isNotEmpty ? toAccount : null,
                  items: ["Pulok Rehan - 1010225345","Rehan Pulok - 1010116545", "Random Guy - 1010112323"].map((account) {
                    return DropdownMenuItem(
                      value: account,
                      child: Text(account),
                    );
                  }).toList(),
                  onChanged: (value) {
                    toAccount = value ?? "";
                  },
                  decoration: InputDecoration(
                    labelText: "To Account",
                    labelStyle: TextStyle(color: AppColors.buttonColor),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.buttonColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: channel.isNotEmpty ? channel : null,
                  items: ["NPSB", "EFT", "MFS Transfer"].map((method) {
                    return DropdownMenuItem(
                      value: method,
                      child: Text(method),
                    );
                  }).toList(),
                  onChanged: (value) {
                    channel = value ?? "";
                  },
                  decoration: InputDecoration(
                    labelText: "Channel",
                    labelStyle: TextStyle(color: AppColors.buttonColor),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.buttonColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                  style: TextStyle(color: AppColors.cardColorPrimary),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  ),
                  onPressed: () {
                    if (amountController.text.isNotEmpty &&
                        fromAccount.isNotEmpty &&
                        toAccount.isNotEmpty &&
                        channel.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OtpPage()),
                      );
                    }
                  },
                  child: Text(
                    "Confirm Transfer",
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
