import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './screens/home_screen.dart';
import './screens/enter_address_screen.dart';
import './screens/receive_screen.dart';
import './screens/send_input_screen.dart';
import './screens/send_confirmation_screen.dart';
import './screens/send_result_screen.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reliet',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        SendInputScreen.routeName: (ctx) => const SendInputScreen(),
        SendConfirmationScreen.routeName: (ctx) =>
            const SendConfirmationScreen(),
        SendResultScreen.routeName: (ctx) => const SendResultScreen(),
        ReceiveScreen.routeName: (ctx) => const ReceiveScreen(),
        EnterAddressScreen.routeName: (ctx) => const EnterAddressScreen(),
      },
    );
  }
}
