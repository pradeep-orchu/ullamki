import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ullamki/examp/map.dart';
import 'package:ullamki/screens/auth/auth_screen.dart';
import 'package:ullamki/screens/home/home_screen.dart';
import 'package:ullamki/service/auth_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(ChangeNotifierProvider(
      create: ((context) => AuthAPI()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<AuthAPI>().status;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ullamki',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          dividerTheme: DividerThemeData(color: Colors.transparent)),
      home: value == AuthStatus.uninitialized
          ? Scaffold(
              appBar: AppBar(),
              body: Center(child: CircularProgressIndicator()),
            )
          : value == AuthStatus.authenticated
              ? HomeScreen()
              : const AuthScreen(),
    );
  }
}
