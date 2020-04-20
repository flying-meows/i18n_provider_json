import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './AppLanguage.dart';
import 'app_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

/* Make the MaterialApp localized */

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: AppLang(),
    );
  }
}
/* Translating text in the UI */
class AppLang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).translate('Message')),
      ),
    );
  }
}