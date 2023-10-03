import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ullamki/firebase_options.dart';
import 'package:ullamki/screens/home/home_screen.dart';
import 'package:ullamki/screens/home/start_screen.dart';
import 'package:ullamki/screens/notification/notification_screen.dart';
import 'package:ullamki/screens/search/search_scren.dart';
import 'package:ullamki/screens/settings/settings_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ullamki',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
          useMaterial3: true,
          dividerTheme: DividerThemeData(color: Colors.transparent)),
      routes: {
        'start': (context) => StartScreen(),
        'home': (context) => HomeScreen(),
        'notification': (context) => NotificationScreen(),
        'settings': (context) => SettingsScreen(),
        'search': (context) => SearchScreen(),
      },
      initialRoute: 'start',
    );
  }
}
