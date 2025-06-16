import 'package:flutter/material.dart';
import 'package:warican/l10n/app_localizations.dart';
import 'package:warican/static/string_data.dart';

void main() {
  runApp(const WaricanApp());
}

/// WaricanApp is the main application widget.
/// It sets up the theme and home page of the app.
class WaricanApp extends StatelessWidget {
  /// Creates a new instance of WaricanApp.
  const WaricanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: StringData.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) => FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.8,
              child: Text(AppLocalizations.of(context)!.test),
            ),
          ),
        ),
      ),
    );
  }
}
