import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fofoqueiro/firebase_options.dart';
import 'package:fofoqueiro/src/home/home_screen.dart';
import 'package:fofoqueiro/src/login/login_screen.dart';
import 'package:fofoqueiro/src/register/register_screen.dart';
import 'package:fofoqueiro/src/services/auth_service.dart';
import 'package:fofoqueiro/src/splash/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/home': (_) => const HomeScreen(),
          '/login': (_) => LoginScreen(),
          '/register': (_) => RegisterScreen()
        },
      ),
    );
  }
}
