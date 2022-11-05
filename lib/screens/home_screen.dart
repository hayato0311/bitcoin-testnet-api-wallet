import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './send_input_screen.dart';
import './receive_screen.dart';

import '../widgets/transaction_history.dart';

const String testnetAddress = 'mpdzWcEn2gKbtcz9PhHH9cdbw3E5Z7Qo4V';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int finalBalanceSatoshi = 0;
  late double finalBalanceBtc = 0;
  late int txCount = 0;
  late List txHistories = [];

  Future<void> getAccountData(address, {testnet = false}) async {
    late String environment;
    if (testnet) {
      environment = 'test3';
    } else {
      environment = 'main';
    }
    var response = await http.get(
      Uri.https(
        'api.blockcypher.com',
        '/v1/btc/$environment/addrs/$address/full',
      ),
    );
    var jsonResponse = json.decode(response.body);

    setState(() {
      finalBalanceSatoshi = jsonResponse['final_balance'];
      finalBalanceBtc = finalBalanceSatoshi / pow(10, 8);
      txCount = jsonResponse['n_tx'];
      txHistories = jsonResponse['txs'];
    });
  }

  @override
  void initState() {
    super.initState();
    getAccountData(testnetAddress, testnet: true);
  }

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
                  child: Center(
                    child: Text("$finalBalanceBtc BTC"),
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
                  margin: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Column(
                    children: [
                      for (int i = 0; i < txCount; i++) ...{
                        TransactionHistory(
                          myAddress: testnetAddress,
                          txHistory: txHistories[i],
                        )
                      },
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
