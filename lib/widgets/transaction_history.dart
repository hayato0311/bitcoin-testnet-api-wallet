// import 'dart:math';

import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  final dynamic myAddress;
  final dynamic txHistory;

  const TransactionHistory(
      {required this.myAddress, required this.txHistory, super.key});

  @override
  Widget build(BuildContext context) {
    // int inputSatoshi = 0;
    // int outputSatoshi = 0;
    // String targetAddress = '';
    // print(txHistory['outputs']);
    // print('input:');
    // txHistory['inputs'].forEach((input) {
    //   if (input['addresses'].contains(myAddress)) {
    //     print(input);
    //     outputSatoshi = input['value'];
    //   }
    // });
    // print('output:');
    // txHistory['outputs'].forEach((output) {
    //   if (output['addresses'].contains(myAddress)) {
    //     print(output);
    //     outputSatoshi = output['value'];
    //   }
    // });

    // double inputBtc = inputSatoshi / pow(10, 8);
    // double outputBtc = outputSatoshi / pow(10, 8);
    // String status = 'Sent';
    // double value = outputBtc - inputBtc;
    // if (value > 0) {
    //   status = 'Received';
    // }

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            child: Column(
              children: const [
                Text(
                  'Received',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'From: tb1q2...r89z4',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            child: Column(
              children: [
                const Text(
                  '0.0001 BTC',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  txHistory['confirmed'],
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
