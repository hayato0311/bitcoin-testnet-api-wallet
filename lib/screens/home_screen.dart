import 'package:flutter/material.dart';

import './send_input_screen.dart';
import './receive_screen.dart';

import '../widgets/transaction_history.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  margin: const EdgeInsets.only(bottom: 100),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text("100 BTC"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20, left: 20),
                        child: SizedBox(
                          width: 100,
                          height: 50,
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
                        margin: const EdgeInsets.only(right: 20, left: 20),
                        child: SizedBox(
                          width: 100,
                          height: 50,
                          child: ElevatedButton(
                            child: const Text('Receive'),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                ReceiveScreen.routeName,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 100, right: 100),
                  child: Column(
                    children: const [
                      TransactionHistory(),
                      TransactionHistory(),
                      TransactionHistory(),
                      TransactionHistory(),
                      TransactionHistory(),
                    ],
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
