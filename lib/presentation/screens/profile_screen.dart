import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appColor.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
          gradient: LinearGradient(
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/avatar.png'), // Replace with your image asset
              ),
              const SizedBox(height: 20),
              const Text(
                'Pulok Rehan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'pulok.rehann@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.buttonColor,
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                subtitle: const Text('01781737807'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Address'),
                subtitle: const Text('6/1 Kodomtola 1st lane, Bashabo'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Date of Birth'),
                subtitle: const Text('Jan 1, 1999'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Blood Group'),
                subtitle: const Text('A+ve'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Primary Account'),
                subtitle: const Text('123456789'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}