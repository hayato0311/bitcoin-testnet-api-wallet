import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String testnetAddress = dotenv.get('PUBKEY');

class EnterAddressScreen extends StatefulWidget {
  const EnterAddressScreen({super.key});
  static const routeName = '/enter_address';

  @override
  State<EnterAddressScreen> createState() => _EnterAddressScreenState();
}

class _EnterAddressScreenState extends State<EnterAddressScreen> {
  bool isInvalid = false;
  @override
  Widget build(BuildContext context) {
    final addressController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'enter your address',
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  controller: addressController,
                  maxLines: 4,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
                child: Text(
                  isInvalid ? 'Entered mnemonic phrase is invalid.' : '',
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Register your Account'),
                    onPressed: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('address', addressController.text);
                      Navigator.of(context).pushReplacementNamed('/');
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
