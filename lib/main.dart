import 'package:flutter/material.dart';

import 'core/AppRouting.dart';

// https://dribbble.com/shots/20245727-Corporate-Wellness-Mobile-App-design-iOS-Android-ux-ui-designer
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouting.corporateWellness,
      onGenerateRoute: (settings) => AppRouting.onGenerateRoute(settings),
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
