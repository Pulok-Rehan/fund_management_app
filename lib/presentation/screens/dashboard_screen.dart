import 'package:flutter/material.dart';
import 'package:fund_management_app/presentation/screens/settings_screen.dart';
import 'package:fund_management_app/presentation/screens/transaction_history_screen.dart';
import '../widgets/appColor.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Avatar at the top center
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/avatar.png'), // Replace with your avatar image path
                ),
              ),
              SizedBox(height: 16),
              // Dashboard title
              Center(
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Divider(thickness: 1, color: AppColors.primaryColor),
              SizedBox(height: 16),
              // Options in a list view
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.settings, color: AppColors.primaryColor),
                      title: Text('Settings', style: TextStyle(fontSize: 16, color: AppColors.primaryColor)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primaryColor),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                      },
                    ),
                    Divider(height: 1, color: Colors.grey.shade300),
                    ListTile(
                      leading: Icon(Icons.list_alt, color: AppColors.primaryColor),
                      title: Text('View All Transactions', style: TextStyle(fontSize: 16, color: AppColors.primaryColor)),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionHistoryPage()));
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // App version at the bottom center
              Center(
                child: Text(
                  'App Version 1.0.0',
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void openDashboard(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const Dashboard(),
  );
}
