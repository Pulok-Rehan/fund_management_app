import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appColor.dart';
import 'home_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _nameController = TextEditingController(text: 'Pulok Rehan');
  final TextEditingController _emailController = TextEditingController(text: 'pulok.rehann@gmail.com');
  final TextEditingController _phoneController = TextEditingController(text: '01781737807');
  final TextEditingController _addressController = TextEditingController(text: '6/1 Kodomtola 1st lane, Bashabo');
  final TextEditingController _dobController = TextEditingController(text: 'Jan 1, 1999');
  final TextEditingController _bloodGroupController = TextEditingController(text: 'A+ve');
  final TextEditingController _accountController = TextEditingController(text: '123456789');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildTextField('Name', _nameController, isEditable: false),
                const SizedBox(height: 15),
                _buildTextField('Email', _emailController),
                const SizedBox(height: 15),
                _buildTextField('Phone', _phoneController),
                const SizedBox(height: 15),
                _buildTextField('Address', _addressController),
                const SizedBox(height: 15),
                _buildTextField('Date of Birth', _dobController),
                const SizedBox(height: 15),
                _buildTextField('Blood Group', _bloodGroupController),
                const SizedBox(height: 15),
                _buildTextField('Primary Account', _accountController, isEditable: false),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _saveSettings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.primaryColor
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

  Widget _buildTextField(String label, TextEditingController controller, {bool isEditable = true}) {
    return TextField(
      controller: controller,
      enabled: isEditable,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.buttonColor),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  void _saveSettings() {
    // Here, save the updated settings or pass them to the backend
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Settings Saved'),
        content: const Text('Your changes have been saved successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _bloodGroupController.dispose();
    _accountController.dispose();
    super.dispose();
  }
}
