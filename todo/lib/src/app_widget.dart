import 'package:flutter/material.dart';
import 'package:todo/src/views/home/home_view.dart';

class AppWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeView(),
    );
  }

}
