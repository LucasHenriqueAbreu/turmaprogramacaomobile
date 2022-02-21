
import 'package:contador/src/home/home_view.dart';
import 'package:flutter/material.dart';

// AppWidget é um Widget 
//(porque ele extende de StatelessWidget, 
//que por sua vez extende de Widget)
// Na OO isso é herança, toda classe que herda de 
// uma classe pai também é to mesmo tipo.
class AppWidget extends StatelessWidget {
  
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(primarySwatch: Colors.teal),
     home: HomeView(),
   );
 }

}