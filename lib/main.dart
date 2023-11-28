import 'package:flutter/material.dart';
import 'package:movie_flix_app/view/Detail_Screen/details_screen.dart';
import 'package:movie_flix_app/view/Home/home_screen.dart';
import 'package:movie_flix_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/detailsPage': (context) => const DetailsScreen(),
      },
    );
  }
}
