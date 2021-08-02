import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:vacation_project/provider/bottom_navigation_provider.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '아니 이거 왜 안돼',
      theme: new ThemeData(
        backgroundColor: Color(0xFF3A70AF),
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) => BottomNavigationProvider(),
        child: LoginPage(),
      ),
    );
  }
}