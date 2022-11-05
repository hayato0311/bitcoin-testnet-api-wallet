import 'dart:math';

import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  final dynamic myAddress;
  final dynamic txHistory;

  const TransactionHistory(
      {required this.myAddress, required this.txHistory, super.key});

  @override
  Widget build(BuildContext context) {
    int inputSatoshi = 0;
    int outputSatoshi = 0;
    bool sent = false;
    String txType = 'Received';
    String partnerAddress = '';
    String partnerAddressLabel = '';

    txHistory['inputs'].forEach((input) {
      if (input['addresses'].contains(myAddress)) {
        sent = true;
        inputSatoshi = input['output_value'];
      } else {
        partnerAddress = input['addresses'][0];
      }
    });
    txHistory['outputs'].forEach((output) {
      if (output['addresses'].contains(myAddress)) {
        outputSatoshi = output['value'];
      } else {
        if (sent) {
          if (output['addresses'].length != 1) {
            debugPrint('error');
          }
          partnerAddress = output['addresses'][0];
        }
      }
    });
    if (sent) {
      txType = 'Sent';
      partnerAddressLabel =
          'To: ${partnerAddress.substring(0, 5)}...${partnerAddress.substring(partnerAddress.length - 4)}';
    } else {
      txType = 'Received';
      partnerAddressLabel =
          'From: ${partnerAddress.substring(0, 5)}...${partnerAddress.substring(partnerAddress.length - 4)}';
    }

    int valueSatoshi = outputSatoshi - inputSatoshi;
    double valueBtc = valueSatoshi / pow(10, 8);

    int confirmationsCount = txHistory['confirmations'];
    String status = 'success';
    if (confirmationsCount < 6) {
      status = 'in proggress';
    }

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            child: Column(
              children: [
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5, left: 5),
            child: Column(
              children: [
                Text(
                  txType,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  partnerAddressLabel,
                  style: const TextStyle(
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
                Text(
                  '$valueBtc BTC',
                  style: const TextStyle(
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
