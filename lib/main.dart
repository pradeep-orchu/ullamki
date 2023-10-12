import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ullamki/examp/dope_screen.dart';
import 'package:ullamki/examp/map.dart';
import 'package:ullamki/screens/auth/auth_screen.dart';
import 'package:ullamki/screens/home/home_screen.dart';
import 'package:ullamki/service/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(ChangeNotifierProvider(
      create: ((context) => AuthService()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<AuthService>().status;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ullamki',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          dividerTheme: DividerThemeData(color: Colors.transparent)),
      home: value == AuthStatus.uninitialized
          ? DopeScreen()
          : value == AuthStatus.authenticated
              ? HomeScreen()
              : const AuthScreen(),
    );
  }
}
