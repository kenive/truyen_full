import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truyen_full/screen/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeLogic(context: context)),
      ],
      child: MaterialApp(
        title: 'Truyện Full ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {'/': (context) => const Home()},
      ),
    );
  }
}
