import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'views/auth/login_view.dart';
import 'views/auth/signup_view.dart';
import 'views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: MaterialApp(
        title: 'Sobat Ternak',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF9C27B0),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF9C27B0),
            primary: const Color(0xFF9C27B0),
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginView(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignupView(),
          '/home': (context) => const HomeView(),
        },
      ),
    );
  }
}
