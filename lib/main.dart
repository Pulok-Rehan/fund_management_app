import 'package:flutter/material.dart';
import 'package:fund_management_app/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'data/balance_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BalanceProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: LoginPage(),
    );
  }
}
