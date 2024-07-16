import 'package:flutter/material.dart';
import 'package:profile_page/Pages/account_management/account%20information/account_information.dart';
import 'package:profile_page/Pages/account_management/account%20information/change_birthday.dart';
import 'package:profile_page/Pages/account_management/account%20information/change_gmail.dart';
import 'package:profile_page/Pages/account_management/account%20information/change_name.dart';
import 'package:profile_page/Pages/account_management/account%20information/change_number.dart';
import 'package:profile_page/Pages/account_management/account%20information/change_password.dart';
import 'package:profile_page/Pages/account_management/account%20information/change_username.dart';
import 'package:profile_page/Pages/account_management/account%20information/two_factor_auth.dart';
import 'package:profile_page/Pages/account_management/device_management/device_management.dart';
import 'package:profile_page/Pages/account_management/medical_information_mgmt.dart';
import 'package:profile_page/Pages/account_management/privacy_security_mgmt.dart';
import 'package:profile_page/Pages/profile/adherence.dart';
import 'package:profile_page/Pages/profile/medical_detais.dart';
import 'package:profile_page/Pages/profile/medical_information.dart';
import 'package:profile_page/Pages/profile/profile.dart';
import 'package:profile_page/Pages/profile/profile_update.dart';
import 'package:profile_page/Pages/account_management/account_management.dart';
import 'package:profile_page/Pages/settings/data%20and%20privacy/data_privacy_settings.dart';
import 'package:profile_page/Pages/settings/data%20and%20privacy/data_sharing.dart';
import 'package:profile_page/Pages/settings/data%20and%20privacy/privacy_settings.dart';
import 'package:profile_page/Pages/settings/language_preferences.dart';
import 'package:profile_page/Pages/settings/notification.dart';
import 'package:profile_page/Pages/settings/settings.dart';
import 'package:profile_page/Pages/settings/support_and_help.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile Page",
      home: ProfilePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        '/profile': (context) => ProfilePage(),
        '/editprofile': (context) => EditProfilePage(),
        '/medical_details': (context) => const MedicalDetais(),
        '/medical_information': (context) => const MedicalInformation(),
        '/adherence': (context) => const Adherence(),
        '/settings': (context) => const Settings(),

        //Settings Routes
        '/data_privacy_settings': (context) => const DataPrivacySettings(),
        '/language_pref': (context) => const LanguagePreferences(),
        '/account_mgmt': (context) => const AccountManagement(),
        '/notification': (context) => const NotificationPage(),
        '/support_and_help': (context) => const SupportAndHelp(),

        //Data and Privacy routes
        '/data_sharing': (context) => const DataSharing(),
        '/privacy_settings': (context) => const PrivacySettings(),

        //Account Management Routes
        '/account_info': (context) => AccountInformation(),
        '/medical_info': (context) => const MedicalInformationMgmt(),
        '/privacy_security_mgmt': (context) => PrivacySecurityMgmt(),
        '/device_mgmt': (context) => DeviceManagement(),

        //Account Informmation Routes
        '/changename': (context) => const ChangeName(),
        '/changeusername': (context) => const ChangeUsername(),
        '/changebirthday': (context) => const ChangeBirthday(),
        '/changenumber': (context) => const ChangeNumber(),
        '/changegmail': (context) => const ChangeGmail(),
        '/changepassword': (context) => const ChangePassword(),
        '/two_factor_auth': (context) => const TwoFactorAuth(),
      },
    );
  }
}