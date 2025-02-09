import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'controllers/auth_controller.dart';
import 'controllers/plant_controller.dart';
import 'views/login_screen.dart';
import 'views/home_screen.dart';
import 'views/detail_screen.dart';

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
        ChangeNotifierProvider(create: (_) => PlantController()),
      ],
      child: MaterialApp.router(
        title: 'Plant Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF2EAE60),
            primary: const Color(0xFF2EAE60),
            surface: Colors.white,
            background: const Color(0xFFF5F5F5),
          ),
          useMaterial3: true,
          cardTheme: CardTheme(
            color: const Color(0xFF2EAE60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Consumer<AuthController>(
          builder: (context, auth, child) {
            return auth.isAuthenticated ? const HomeScreen() : const LoginScreen();
          },
        );
      },
    ),
    GoRoute(
      path: '/detail/:id',
      name: 'detail',
      builder: (context, state) {
        final plantId = state.pathParameters['id']!;
        return DetailScreen(plantId: plantId);
      },
    ),
  ],
);
