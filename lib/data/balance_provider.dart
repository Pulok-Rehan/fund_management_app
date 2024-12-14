import 'package:flutter/material.dart';

class BalanceProvider with ChangeNotifier {
  double _balance = 10000.00; // Initial balance

  double get balance => _balance;

  void deposit(double amount) {
    _balance += amount;
    notifyListeners();
  }

  bool withdraw(double amount) {
    if (amount > _balance) {
      return false;
    }
    _balance -= amount;
    notifyListeners();
    return true;
  }
}
