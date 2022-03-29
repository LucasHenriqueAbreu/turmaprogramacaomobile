import 'package:flutter/material.dart';
import 'package:projetox/src/core/routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: CustomRoutes.onGeneratedRoute,
    );
  }
}
