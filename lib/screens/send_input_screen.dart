import 'package:flutter/material.dart';

import './send_confirmation_screen.dart';

class SendInputScreen extends StatelessWidget {
  const SendInputScreen({super.key});
  static const routeName = '/send';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                    child: const Text('Back'),
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
                    child: const Text('Next'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        SendConfirmationScreen.routeName,
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
