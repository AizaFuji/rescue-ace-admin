import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/dependency_injection.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/splash_page.dart';
import 'presentation/pages/edit_profile_page.dart';
import 'presentation/pages/add_alat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: DependencyInjection.getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rescue Ace Admin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(user: {}),
          '/editprofile': (context) => const EditProfilePage(),
          '/add_alat': (context) => const AddAlatPage(),
        },
      ),
    );
  }
}
