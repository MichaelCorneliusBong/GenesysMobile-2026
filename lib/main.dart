import 'package:flutter/material.dart';
import 'pages/bookmarks_page.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'pages/quiz_page.dart';
import 'pages/register_page.dart';
import 'pages/shell_page.dart';

void main() {
  runApp(const GenesysMetaApp());
}

class GenesysMetaApp extends StatelessWidget {
  const GenesysMetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GenesysMeta Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D11),
        primaryColor: const Color(0xFFE52E3D),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE52E3D),
          surface: Color(0xFF14141A),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF1B1B24),
          contentTextStyle: TextStyle(color: Colors.white, fontSize: 13),
          behavior: SnackBarBehavior.floating,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ShellPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/bookmarks': (context) => const BookmarksPage(),
        '/quiz': (context) => const QuizPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
