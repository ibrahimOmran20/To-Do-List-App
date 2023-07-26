
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/App%20Config%20Provider/App%20Config%20Provider.dart';
import 'package:to_do_app/Home/HomeScreen.dart';
import 'package:to_do_app/My%20Theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{ WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
FirebaseFirestore.instance.settings =
    Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(create: (context)=>AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
      theme: MythemeData.lightTheme,
      darkTheme: MythemeData.darkTheme,
      themeMode: provider.appTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.appLanguage)
    );
  }
}
