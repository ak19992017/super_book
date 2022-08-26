// ignore_for_file: unused_import, prefer_const_constructors
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:super_book/screens/emoji_api.dart';
import 'package:super_book/screens/glassmorphism.dart';
import 'package:super_book/screens/nice%20nft/home.dart';
import 'package:super_book/screens/onboarding.dart';
import 'package:super_book/screens/responsive.dart';
import 'package:super_book/screens/tables.dart';
import 'package:super_book/screens/vegy_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Book',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        // brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      // home: ResponsiveLayout(
      //   desktopLayout: GlassMorphism(),
      //   mobileLayout: OnboardingScreen(),
      // ),
      home: MyEmoji(),
    );
  }
}
