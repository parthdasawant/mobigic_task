import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobigic_task/presentation/home_page/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: false
  ));
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    // PrefUtils().init()
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = Brightness.light;
    return MaterialApp(
      title: "mobigic_task",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: brightness,
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale(
          'en',
          '',
        ),
      ],
    );
  }
}
