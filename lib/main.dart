import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'routes/routes_name.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations In Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RoutesName.homepage,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
