import 'package:flutter/material.dart';

import 'appColor.dart';

class Customwidgets{

  static Widget actionButton(String label, IconData icon, Color color, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: AppColors.buttonColor, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  static Widget transactionTile(IconData icon, String title, String subtitle, String trailing) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.cardColorPrimary,
          child: Icon(icon, color: AppColors.primaryColor),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.buttonColor)),
        subtitle: Text(subtitle),
        trailing: Text(trailing, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}