import 'package:flutter/material.dart';
import 'package:sparrow/core/constants/app_colors.dart';
import 'package:sparrow/features/pages/ListPage.dart';
import 'package:sparrow/features/pages/ask_us.dart';
import 'package:sparrow/features/pages/homepage.dart';
import 'package:sparrow/features/pages/splash_screen.dart';
import 'package:sparrow/core/Backend/pickdata.dart';
import 'package:sparrow/route/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
