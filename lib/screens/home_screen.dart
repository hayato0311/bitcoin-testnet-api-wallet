import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './send_input_screen.dart';
import './receive_screen.dart';

import '../widgets/transaction_history.dart';

import '../helpers/blockcypher_api.dart';

final String testnetAddress = dotenv.get('PUBKEY');

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
  bool isBtc = true;

  Future<void> getAccountData(address, {testnet = false}) async {
    var jsonResponse =
        await BlockcypherApi.getAccountFullData(address, testnet: testnet);

    setState(() {
      finalBalanceSatoshi = jsonResponse['final_balance'];
      finalBalanceBtc = finalBalanceSatoshi / pow(10, 8);
      txCount = jsonResponse['final_n_tx'];
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
        child: RefreshIndicator(
          onRefresh: () async {
            await getAccountData(testnetAddress, testnet: true);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 200,
                    margin: const EdgeInsets.only(top: 30, bottom: 50),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    // TODO: switch btc and satoshi when tapped
                    child: Center(
                      child: SizedBox(
                        width: 300 - 30,
                        height: 200 - 30,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            elevation: 0,
                            // shadowColor: Colors.black,
                            // animationDuration: const Duration(seconds: 0),
                          ),
                          child: Text(
                            isBtc
                                ? "$finalBalanceBtc BTC"
                                : "$finalBalanceSatoshi satoshi",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isBtc = !isBtc;
                            });
                          },
                        ),
                      ),
                      // child: Text(
                      //   isBtc
                      //       ? "$finalBalanceBtc BTC"
                      //       : "$finalBalanceSatoshi satoshi",
                      //   style: const TextStyle(
                      //     fontSize: 30,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
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
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: const Text(
                      'Histories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                    child: const Divider(
                      height: 20,
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        for (int i = 0; i < txCount; i++) ...{
                          TransactionHistory(
                            myAddress: testnetAddress,
                            txHistory: txHistoryProcessing(
                              testnetAddress,
                              txHistories[i],
                            ),
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
      ),
    );
  }
}
