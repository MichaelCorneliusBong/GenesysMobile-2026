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
      onGenerateRoute: (settings) {
        Widget page = const ShellPage();
        if (settings.name == '/login') {
          page = const LoginPage();
        } else if (settings.name == '/register') {
          page = const RegisterPage();
        } else if (settings.name == '/bookmarks') {
          page = const BookmarksPage();
        } else if (settings.name == '/quiz') {
          page = const QuizPage();
        } else if (settings.name == '/profile') {
          page = const ProfilePage();
        }

        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 250),
        );
      },
    );
  }
}
