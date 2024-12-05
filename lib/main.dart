import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/home/home_screen.dart';
import 'package:weather_app/features/seach/screens/search_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(
        255,
        34,
        34,
        41,
      ), // Navigation bar color
      systemNavigationBarIconBrightness:
          Brightness.light, // Icons on the navigation bar
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:const Color.fromARGB(255, 21, 21, 22),
        textTheme: const TextTheme(
          displayLarge:  TextStyle(
              color: Color.fromARGB(255, 175, 171, 181),
              fontWeight: FontWeight.w600,
              fontSize: 35),
          bodySmall: TextStyle(
            color: Color.fromARGB(255, 33, 33, 34),
          ),
        ),
      ),
       routes: {
        '/homeScreen': (context) => const HomeScreen(),
        '/seachScreen': (context) =>  SearchScreen(),
        
      },
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
