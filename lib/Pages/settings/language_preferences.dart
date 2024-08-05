import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePreferences extends StatefulWidget {
  const LanguagePreferences({super.key});

  @override
  _LanguagePreferencesState createState() => _LanguagePreferencesState();
}

class _LanguagePreferencesState extends State<LanguagePreferences> {
  List<String> _languages = ['English (United Kingdom)'];
  String? _selectedLanguage = 'English (United Kingdom)';

@override
void initState() {
  super.initState();
  _loadLanguages();
}

Future<void> _loadLanguages() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? storedLanguages = prefs.getStringList('languages');
  if (storedLanguages != null) {
    setState(() {
      _languages = storedLanguages;

      // Determine the current locale
      Locale currentLocale = context.locale;

      // Find the matching language string
      _selectedLanguage = _languages.firstWhere(
        (language) => _getLocaleFromLanguage(language) == currentLocale,
        orElse: () => _languages.first,
      );
    });
  }
}

Future<void> _saveLanguages() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('languages', _languages);
}

void _addLanguage() async {
  final selectedLanguage = await Navigator.push<String>(
    context,
    MaterialPageRoute(builder: (context) => LanguageSelectionPage()),
  );
  if (selectedLanguage != null && !_languages.contains(selectedLanguage)) {
    setState(() {
      _languages.add(selectedLanguage);
      _selectedLanguage = selectedLanguage;
      _changeLocale(selectedLanguage);
    });
    _saveLanguages();
  }
}

void _selectLanguage(String language) {
  setState(() {
    _selectedLanguage = language;
    _changeLocale(language);
  });
}

void _changeLocale(String language) {
  switch (language) {
    case 'English (United Kingdom)':
    case 'English':
      context.setLocale(const Locale('en', 'US'));
      break;
    case 'French (France)':
    case 'French':
      context.setLocale(const Locale('fr', 'FR'));
      break;
    case 'Hindi (India)':
    case 'Hindi':
      context.setLocale(const Locale('hi', 'IN'));
      break;
    case 'Nepali (Nepal)':
    case 'Nepali':
      context.setLocale(const Locale('ne', 'NP'));
      break;
    case 'Spanish (Spain)':
    case 'Spanish':
      context.setLocale(const Locale('es', 'ES'));
      break;
    case 'Portuguese (Portugal)':
    case 'Portuguese':
      context.setLocale(const Locale('pt', 'PT'));
      break;
    case 'Japanese (Japan)':
    case 'Japanese':
      context.setLocale(const Locale('ja', 'JP'));
      break;
    case 'Korean (Korea)':
    case 'Korean':
      context.setLocale(const Locale('ko', 'KR'));
      break;
    // Add more cases for other languages
  }
}

// Helper method to get locale from language string
Locale _getLocaleFromLanguage(String language) {
  switch (language) {
    case 'English (United Kingdom)':
    case 'English':
      return const Locale('en', 'US');
    case 'French (France)':
    case 'French':
      return const Locale('fr', 'FR');
    case 'Hindi (India)':
    case 'Hindi':
      return const Locale('hi', 'IN');
    case 'Nepali (Nepal)':
    case 'Nepali':
      return const Locale('ne', 'NP');
    case 'Spanish (Spain)':
    case 'Spanish':
      return const Locale('es', 'ES');
    case 'Portuguese (Portugal)':
    case 'Portuguese':
      return const Locale('pt', 'PT');
    case 'Japanese (Japan)':
    case 'Japanese':
      return const Locale('ja', 'JP');
    case 'Korean (Korea)':
    case 'Korean':
      return const Locale('ko', 'KR');
    // Add more cases for other languages
    default:
      return const Locale('en', 'US'); // Default locale if none match
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('language_preference'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'default_language_message'.tr(),
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_languages[index]),
                  trailing: _selectedLanguage == _languages[index]
                      ? const Icon(Icons.check, color: Colors.blue)
                      : null,
                  onTap: () => _selectLanguage(_languages[index]),
                );
              },
            ),
            ListTile(
              title: Text(
                'add_language'.tr(),
                style: const TextStyle(color: Colors.blue),
              ),
              leading: const Icon(Icons.add, color: Colors.blue),
              onTap: _addLanguage,
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  final List<String> _allLanguages = [
    'English',
    'French',
    'Hindi',
    'Nepali',
    'Spanish',
    'German',
    'Chinese',
    'Japanese',
    'Korean',
    'Italian',
    'Portuguese',
    'Russian',
    'Arabic',
    'Bengali',
    'Urdu',
    'Swahili',
    // Add more languages as needed
  ];
  LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_language'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'suggested_by_app'.tr(),
              style: const TextStyle(color: Colors.grey),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _allLanguages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_allLanguages[index]),
                    onTap: () {
                      Navigator.pop(context, _allLanguages[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
