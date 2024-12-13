import 'package:flutter/material.dart';
import 'package:fund_management_app/presentation/screens/settings_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
    }
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.cardColorPrimary, AppColors.cardColorSecondary],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(25.0),
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
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  showBalance ? '10,000.00 TK' : '****',
                                  style: TextStyle(
                                    color: AppColors.textColorWhite,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.credit_card,
                              color: AppColors.primaryColor,
                              size: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pulok Rehan',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              showBalance ?
                              '1011012323930' : '***** 323930',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16,
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
                    Expanded(
                      child: SfCircularChart(
                        title: ChartTitle(
                          text: 'Deposits',
                          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppColors.cardColorPrimary),
                        ),
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                          overflowMode: LegendItemOverflowMode.wrap,
                          textStyle: TextStyle(color: AppColors.buttonColor),
                        ),
                        series: <CircularSeries>[PieSeries<_ChartData, String>(
                          dataSource: [
                            _ChartData('December', 2),
                            _ChartData('November', 5),
                            _ChartData('October', 1),
                            _ChartData('September', 3),
                          ],
                          xValueMapper: (_ChartData data, _) => data.category,
                          yValueMapper: (_ChartData data, _) => data.value,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )],
                      ),
                    ),
                    Expanded(
                      child: SfCircularChart(
                        title: ChartTitle(
                          text: 'Withdrawals',
                          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppColors.cardColorPrimary),
                        ),
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                          overflowMode: LegendItemOverflowMode.wrap,
                          textStyle: TextStyle(color: AppColors.buttonColor),
                        ),
                        series: <CircularSeries>[PieSeries<_ChartData, String>(
                          dataSource: [
                            _ChartData('December', 5),
                            _ChartData('November', 1),
                            _ChartData('October', 3),
                            _ChartData('September', 1),
                          ],
                          xValueMapper: (_ChartData data, _) => data.category,
                          yValueMapper: (_ChartData data, _) => data.value,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )],
                      ),
                    ),
                    Expanded(
                      child: SfCircularChart(
                        title: ChartTitle(
                          text: 'Fund Transfers',
                          textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: AppColors.cardColorPrimary),
                        ),
                        legend: Legend(
                          isVisible: true,
                          position: LegendPosition.bottom,
                          overflowMode: LegendItemOverflowMode.wrap,
                          textStyle: TextStyle(color: AppColors.buttonColor),
                        ),
                        series: <CircularSeries>[PieSeries<_ChartData, String>(
                          dataSource: [
                            _ChartData('December', 1),
                            _ChartData('November', 2),
                            _ChartData('October', 3),
                            _ChartData('September', 5),
                          ],
                          xValueMapper: (_ChartData data, _) => data.category,
                          yValueMapper: (_ChartData data, _) => data.value,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        )],
                      ),
                    ),
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
}

class _ChartData {
  _ChartData(this.category, this.value);
  final String category;
  final double value;
}