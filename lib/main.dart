// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:profile_page/Pages/Notification/show_notifications.dart';
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
import 'package:profile_page/Pages/homepage/homepage.dart';
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
import 'package:profile_page/Pages/settings/support_and_help/bug_report.dart';
import 'package:profile_page/Pages/settings/support_and_help/feedback.dart';
import 'package:profile_page/Pages/settings/support_and_help/help_center.dart';
import 'package:profile_page/Pages/settings/support_and_help/make_suggestion.dart';
import 'package:profile_page/Pages/settings/support_and_help/report_problem.dart';
import 'package:profile_page/Pages/settings/support_and_help/support_and_help.dart';
import 'package:profile_page/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeManager _themeManager = ThemeManager();

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cure Me",
      home: const HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'fonts/Poppins',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
          canvasColor: Colors.white),
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      routes: {
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/editprofile': (context) => const EditProfilePage(),
        '/medical_details': (context) => const MedicalDetais(),
        '/medical_information': (context) => const MedicalInformation(),
        '/adherence': (context) => const Adherence(),
        '/settings': (context) => const Settings(),

        //Settings Routes
        '/data_privacy_settings': (context) => const DataPrivacySettings(),
        '/language_pref': (context) => const LanguagePreferences(),
        '/account_mgmt': (context) => const AccountManagement(),
        '/notification': (context) => NotificationSettings(),

        //Data and Privacy routes
        '/data_sharing': (context) => const DataSharing(),
        '/privacy_settings': (context) => const PrivacySettings(),

        //Account Management Routes
        '/account_info': (context) => const AccountInformation(),
        '/medical_info': (context) => const MedicalInformationMgmt(),
        '/privacy_security_mgmt': (context) => const PrivacySecurityMgmt(),
        '/device_mgmt': (context) => const DeviceManagement(),

        //Account Informmation Routes
        '/changename': (context) => const ChangeName(),
        '/changeusername': (context) => const ChangeUsername(),
        '/changebirthday': (context) => const ChangeBirthday(),
        '/changenumber': (context) => const ChangeNumber(),
        '/changegmail': (context) => const ChangeGmail(),
        '/changepassword': (context) => const ChangePassword(),
        '/two_factor_auth': (context) => const TwoFactorAuth(),

        //Settings => Support and Help
        '/support_and_help': (context) => const SupportAndHelp(),
        '/report_problem': (context) => const ReportProblem(),
        '/helpcenter': (context) => const HelpCenter(),
        '/feedback': (context) => const UserFeedback(),
        '/bug_report': (context) => const BugReport(),
        '/make_suggestion': (context) => const MakeSuggestion(),

        //Notifications
        '/show_notifications': (context) => const ShowNotifications(),
      },
    );
  }
}
