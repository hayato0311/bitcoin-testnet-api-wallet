import 'package:flutter/material.dart';

class SendResultScreen extends StatelessWidget {
  const SendResultScreen({super.key});
  static const routeName = '/send_result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                margin: const EdgeInsets.only(bottom: 30),
                child: const Text(
                  'Sending',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
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
                    child: const Text('Return to home screen'),
                    onPressed: () {
                      Navigator.of(context).popUntil(ModalRoute.withName('/'));
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
