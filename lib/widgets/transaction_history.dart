import 'package:flutter/material.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({super.key});

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
              children: const [
                Text(
                  'Receive',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'From: address',
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
              children: const [
                Text(
                  '+0.001 BTC',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  '2022-11-5',
                  style: TextStyle(
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
