import 'package:flutter/material.dart';

import './send_result_screen.dart';

class SendConfirmationScreen extends StatelessWidget {
  const SendConfirmationScreen({super.key});
  static const routeName = '/send_confirmation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'amount',
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'to',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'address',
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'with Transfer Fee',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'transfer fee',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
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
                      child: const Text('Send'),
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          SendResultScreen.routeName,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
