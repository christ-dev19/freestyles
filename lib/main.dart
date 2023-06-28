import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/AppRouting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: true,
        initialRoute: AppRouting.corporateWellness,
        onGenerateRoute: (settings) => AppRouting.onGenerateRoute(settings),
        onGenerateTitle: (context) {
          return "context";
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
