import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ullamki/screens/home/home_screen.dart';
import 'package:ullamki/screens/home/start_screen.dart';
import 'package:ullamki/screens/notification/notification_screen.dart';
import 'package:ullamki/screens/profile/add_user_details.dart';
import 'package:ullamki/screens/search/search_scren.dart';
import 'package:ullamki/screens/settings/settings_screen.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Client client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('vallanki')
      .setSelfSigned(status: true);
  Account account =
      Account(client); // For self signed certificates, only use for development
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ullamki',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          dividerTheme: DividerThemeData(color: Colors.transparent)),
      routes: {
        'start': (context) => StartScreen(),
        'home': (context) => HomeScreen(),
        'notification': (context) => NotificationScreen(),
        'settings': (context) => SettingsScreen(),
        'search': (context) => SearchScreen(),
        'details': (context) => AddUserDetailsScreen(),
      },
      initialRoute: 'home',
    );
  }
}
