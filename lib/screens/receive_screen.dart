import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({super.key});
  static const routeName = '/receive';

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  final addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = dotenv.env['pubkey']!;
  }

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
                    'Your Address',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: addressController,
                    enabled: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'address',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      child: const Text('copy'),
                      onPressed: () async {
                        final data =
                            ClipboardData(text: addressController.text);
                        await Clipboard.setData(data);
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
                      child: const Text('Back'),
                      onPressed: () {
                        Navigator.of(context).pop();
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
