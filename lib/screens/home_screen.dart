import 'package:flutter/material.dart';

import 'send_input_screen.dart';
import './receive_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                margin: const EdgeInsets.only(bottom: 150),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text("100 BTC"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: const Text('Send'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        SendInputScreen.routeName,
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    child: const Text('Receive'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        ReceiveScreen.routeName,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
