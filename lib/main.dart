import 'package:flutter/material.dart';
import 'package:flutter_localization/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // List All Supported Locales
      supportedLocales: [
        // you can add countryCode too as second parameter on each Locale
        Locale('id'),
        Locale('en'),
      ],
      // List All Supported Localization Delegate
      localizationsDelegates: [
        // Our Localization Delegate
        AppLocalizations.delegate,
        // Material App Localization Delegate
        GlobalMaterialLocalizations.delegate,
        // Cupertion App Localization Delegate
        GlobalCupertinoLocalizations.delegate,
        // Widget Localization Delegate, to support RTL - LTR
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used for the app
      localeResolutionCallback: (locale, supportedLocales) {
        print("locale : $locale");
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              // you can add country code too for validation
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first;
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('app_name')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('title')),
            Text(AppLocalizations.of(context).translate('subtitle')),
          ],
        ),
      ),
    );
  }
}
