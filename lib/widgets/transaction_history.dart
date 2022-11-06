import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  final dynamic myAddress;
  final dynamic txHistory;

  const TransactionHistory(
      {required this.myAddress, required this.txHistory, super.key});

  @override
  Widget build(BuildContext context) {
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
                  txHistory['status'],
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
                  txHistory['txType'],
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  txHistory['partnerAddressLabel'],
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
                  '${txHistory['valueBtc']} BTC',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  txHistory['confirmedAt'],
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
