import 'package:flutter/material.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Account Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pushNamed(context, '/account_mgmt');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAccountInfoRow(
                context, 'Name', 'kylan Gentry', () => handleNameTap(context)),
            buildAccountInfoRow(context, 'Username', 'kylan Gentry',
                () => handleUsernameTap(context)),
            buildAccountInfoRow(context, 'Birthday', '15/02/1997',
                () => handleBirthdayTap(context)),
            buildAccountInfoRow(context, 'Mobile Number', '9845555555',
                () => handleMobileNumberTap(context)),
            buildAccountInfoRow(context, 'Gmail', 'kylan@gmail.com',
                () => handleGmailTap(context)),
            buildAccountInfoRow(context, 'Password', '********',
                () => handlePasswordTap(context)),
            buildAccountInfoRow(context, 'Two factor Authentication', '',
                () => handleTwoFactorAuthenticationTap(context)),
          ],
        ),
      ),
    );
  }

  Widget buildAccountInfoRow(
      BuildContext context, String label, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                value,
                style: const TextStyle(color: Color.fromARGB(226, 94, 94, 94)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleNameTap(BuildContext context) {
    Navigator.pushNamed(context, '/changename');
  }

  void handleUsernameTap(BuildContext context) {
    Navigator.pushNamed(context, '/changeusername');
  }

  void handleBirthdayTap(BuildContext context) {
    Navigator.pushNamed(context, '/changebirthday');
  }

  void handleMobileNumberTap(BuildContext context) {
    Navigator.pushNamed(context, '/changenumber');
  }

  void handleGmailTap(BuildContext context) {
    Navigator.pushNamed(context, '/changegmail');
  }

  void handlePasswordTap(BuildContext context) {
    Navigator.pushNamed(context, '/changepassword');
  }

  void handleTwoFactorAuthenticationTap(BuildContext context) {
    Navigator.pushNamed(context, '/two_factor_auth');
  }
}
