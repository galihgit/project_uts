import 'package:apk_beasiswa/Login_page.dart';
import 'package:apk_beasiswa/bookmarkPage.dart';
import 'package:apk_beasiswa/detail.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'package:apk_beasiswa/sortir.dart';
import 'package:apk_beasiswa/DaftarPage.dart';

void main() {
  runApp(const utama());
}

class utama extends StatefulWidget {
  const utama({super.key});

  @override
  State<utama> createState() => _utamaState();
}

class _utamaState extends State<utama> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/a': (context) => Home(),
      },
    );
  }
}
