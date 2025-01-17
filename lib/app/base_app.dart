import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:AIApp/screens/home_screen.dart';
import 'package:AIApp/theme.dart';

import '../env/.env.dart';

class BaseApp extends StatelessWidget {
  final bool auth;

  const BaseApp({super.key, required this.auth});

  @override
  Widget build(BuildContext context) => MaterialApp(
        builder: auth ? Authenticator.builder() : null,
        debugShowCheckedModeBanner: Environment.isDev,
        theme: theme,
        home: const HomeScreen(),
      );
}
