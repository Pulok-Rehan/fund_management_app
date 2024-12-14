import 'package:flutter/material.dart';
import 'package:fund_management_app/presentation/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../data/balance_provider.dart';
import '../../data/chartData.dart';
import '../../data/static_data.dart';
import 'amount_screen.dart';
import '../widgets/appColor.dart';
import '../widgets/customWidgets.dart';
import 'dashboard_screen.dart';
import 'fund_transferScreen.dart';
import 'login_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showBalance = false;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      switch (index) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          break;
        case 1:
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case 2:
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final balance = context.watch<BalanceProvider>().balance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fund Management',
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        backgroundColor: AppColors.buttonColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.person, color: AppColors.buttonColor),
          ),
          onPressed: () => openDashboard(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: AppColors.primaryColor),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.primaryColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showBalance = !showBalance;
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black45,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.cardColorPrimary.withOpacity(0.9),
                          AppColors.cardColorSecondary.withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Available Balance',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  showBalance ? "${balance.toStringAsFixed(2)}" : '****',
                                  style: TextStyle(
                                    color: AppColors.textColorWhite,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.credit_card,
                                color: AppColors.primaryColor,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Divider(
                          color: Colors.white30,
                          thickness: 1,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StaticData.userName,
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              showBalance ? StaticData.accountNumber : '***** ${StaticData.accountNumber.substring(9)}',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Customwidgets.actionButton('Deposit Funds', Icons.add_circle, AppColors.buttonColor, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AmountPage(transactionType: 'Deposit Funds')));
                  }),
                  Customwidgets.actionButton('Withdraw Funds', Icons.remove_circle, AppColors.buttonColor, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AmountPage(transactionType: 'Withdraw Funds')));
                  }),
                  Customwidgets.actionButton('Transfer Funds', Icons.swap_horiz, AppColors.buttonColor, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FundTransferPage()));
                  }),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Transaction Charts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.buttonColor,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Row(
                  children: [
                    _buildChart('Deposits', StaticData.depositsData),
                    _buildChart('Withdrawals', StaticData.withdrawalsData),
                    _buildChart('Fund Transfers', StaticData.transfersData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.buttonColor,
        selectedItemColor: AppColors.secondaryAccent,
        unselectedItemColor: AppColors.primaryColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildChart(String title, List<ChartData> data) {
    return Expanded(
      child: SfCircularChart(
        title: ChartTitle(
          text: title,
          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppColors.cardColorPrimary),
        ),
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
          textStyle: TextStyle(color: AppColors.buttonColor),
        ),
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}