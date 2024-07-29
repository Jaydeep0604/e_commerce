import 'package:e_commerce/navigator/routes.dart';
import 'package:e_commerce/navigator/tab_item.dart';
import 'package:e_commerce/ui/splash/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigationKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      onGenerateRoute: ECRoutes.generateGlobalRoute,
    );
  }
}

