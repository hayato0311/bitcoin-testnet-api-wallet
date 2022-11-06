import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
// import 'package:secp256k1/secp256k1.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:hex/hex.dart';
import 'package:bs58/bs58.dart';

const String blockcypherToken = 'eba423a0e7da4af0ab92c63893fdde49';

Future<void> _postRequestCreateNewTx() async {
  Map<String, String> headers = {'content-type': 'application/json'};
  String body = json.encode({
    "inputs": [
      {
        "addresses": ["msddz1myzabqi8TWfxr8ich2bJer63C2Qj"]
      }
    ],
    "outputs": [
      {
        "addresses": ["mpdzWcEn2gKbtcz9PhHH9cdbw3E5Z7Qo4V"],
        "value": 1000
      }
    ]
  });

  http.Response resp = await http.post(
      Uri.https(
        'api.blockcypher.com',
        '/v1/btc/test3/txs/new',
      ),
      headers: headers,
      body: body);
  print(resp.statusCode);
  print(resp.body);
}

Future<void> _postRequestSendSignature(
  Map<String, dynamic> tx,
  List tosigns,
  List signatures,
  List pubkeys,
) async {
  Map<String, String> headers = {'content-type': 'application/json'};

  String body = json.encode({
    "tx": tx,
    "tosign": tosigns,
    "signatures": signatures,
    "pubkeys": pubkeys
  });

  print(body);

  http.Response resp = await http.post(
      Uri.https(
        'api.blockcypher.com',
        '/v1/btc/test3/txs/send',
        {'token': blockcypherToken},
      ),
      headers: headers,
      body: body);
  print(resp.statusCode);
  print(resp.body);
}

Uint8List genSignature(nodeFromSeed, z) {
  var rAndS = nodeFromSeed.sign(Uint8List.fromList(z));
  List<int> rbin = rAndS.sublist(0, 32).toList();
  List<int> sbin = rAndS.sublist(32).toList();
  // remove all null bytes at the beginning
  var currentRbinBit = rbin[0];
  while (currentRbinBit == 0x00) {
    rbin.removeAt(0);
    currentRbinBit = rbin[0];
  }
  // if rbin has a high bit, add a \x00
  if (rbin[0] >= 0x80) {
    rbin.insert(0, 0x00);
  }
  // print(rbin);
  List<int> rbinResult = rbin;
  rbinResult.insertAll(0, [2, rbin.length]);
  print(rbinResult);

  // # remove all null bytes at the beginning
  var currentSbinBit = sbin[0];
  while (currentSbinBit == 0x00) {
    sbin.removeAt(0);
    currentSbinBit = sbin[0];
  }
  // # if sbin has a high bit, add a \x00
  if (sbin[0] >= 0x80) {
    sbin.insert(0, 0x00);
  }
  print(sbin);

  List<int> sbinResult = sbin;
  sbinResult.insertAll(0, [2, sbin.length]);
  List<int> result = [...rbinResult, ...sbinResult];
  result.insertAll(0, [0x30, result.length]);
  return Uint8List.fromList(result);
}

Future<void> _postRequestSendTx(tx) async {
  Map<String, String> headers = {'content-type': 'application/json'};

  String body = json.encode({"tx": tx});

  print(body);

  http.Response resp = await http.post(
      Uri.https(
        'api.blockcypher.com',
        '/v1/btc/test3/txs/push',
        {'token': blockcypherToken},
      ),
      headers: headers,
      body: body);
  print(resp.statusCode);
  print(resp.body);
}

main() async {
  // await _postRequestCreateNewTx();
  // String randomMnemonic = bip39.generateMnemonic();
  // print(randomMnemonic);

  final seed = bip39.mnemonicToSeed(
      'kick abstract blush dice series thought dial typical aisle often purity alley');
  // print(seed);
  bip32.BIP32 nodeFromSeed = bip32.BIP32.fromSeed(seed);

  // print(base58.encode(
  //   Uint8List.fromList(
  //       [...nodeFromSeed.identifier, ...nodeFromSeed.fingerprint]),
  // ));
  // print(nodeFromSeed.privateKey);

  Map<String, dynamic> tx = {
    "block_height": -1,
    "block_index": -1,
    "hash": "5143486c1b364803f09b56dc64cb9c5db78cabd0d630157789b21332d8c319b5",
    "addresses": [
      "msddz1myzabqi8TWfxr8ich2bJer63C2Qj",
      "mpdzWcEn2gKbtcz9PhHH9cdbw3E5Z7Qo4V"
    ],
    "total": 48400,
    "fees": 18600,
    "size": 226,
    "vsize": 226,
    "preference": "medium",
    "relayed_by": "240d:1a:758:e800:1c7c:3418:b2ac:2220",
    "received": "2022-11-06T09:31:07.313819597Z",
    "ver": 1,
    "double_spend": false,
    "vin_sz": 2,
    "vout_sz": 2,
    "confirmations": 0,
    "inputs": [
      {
        "prev_hash":
            "e6bfe44d9969f022604043b61d8efc9d0ef271e0e73f423767824ca504e9ee2c",
        "output_index": 0,
        "output_value": 10000,
        "sequence": 4294967295,
        "addresses": ["msddz1myzabqi8TWfxr8ich2bJer63C2Qj"],
        "script_type": "pay-to-pubkey-hash",
        "age": 0
      },
      {
        "prev_hash":
            "42da881aca3b0e0dd94e8497c510cfe13585fef7d56a40b94637f06ad0231ca5",
        "output_index": 0,
        "output_value": 57000,
        "sequence": 4294967295,
        "addresses": ["msddz1myzabqi8TWfxr8ich2bJer63C2Qj"],
        "script_type": "pay-to-pubkey-hash",
        "age": 0
      }
    ],
    "outputs": [
      {
        "value": 1000,
        "script": "76a914640de4dc7abf1ced9ef2b4a0b92ed0d5c46eb8ef88ac",
        "addresses": ["mpdzWcEn2gKbtcz9PhHH9cdbw3E5Z7Qo4V"],
        "script_type": "pay-to-pubkey-hash"
      },
      {
        "value": 47400,
        "script": "76a91484e522c79e681dd46ceb8d9bea0f95a1d857fece88ac",
        "addresses": ["msddz1myzabqi8TWfxr8ich2bJer63C2Qj"],
        "script_type": "pay-to-pubkey-hash"
      }
    ]
  };

  List<String> tosigns = [
    "d08299b9b6924882b910f699263af59b7574b8704aaedbbdbf7cb6a85b8c290e",
    "fe6cc1c68a2f1db8330c56eeb2b4e7c3fc751370fd122b360e4b2529c894f545"
  ];

  List<String> pubkeys = [];
  for (int i = 0; i < tosigns.length; i++) {
    pubkeys.add(HEX.encode(nodeFromSeed.publicKey));
  }
  List<String> signatures = [
    '304402202c912e27a432d1bab0a25cc8cc9392a04f14e97ab38832cd6a475e712dcbcf0b02205de2030e01f219005a88ed8692bf738039c3f58d9ba6f0105f30344b4616be0e',
    '3045022100cb7faa185081c0aa83940e29c8f3b05749f02cee2681829814f78d22ec8e3338022062a668e7db15153d282d47ff5c5b36ed2d61b8a068d7b453a5d6fd2ed4cb581e'
  ];

  // List<String> signatures = tosigns.map((tosign) {
  //   var message = HEX.decode(tosign);
  //   return HEX.encode(genSignature(nodeFromSeed, message));
  //   // if (nodeFromSeed.verify(Uint8List.fromList(message), signature)) {
  //   //   return HEX.encode(signature);
  //   // } else {
  //   //   throw Exception('Signature is invalid');
  //   // }
  // }).toList();

  // _postRequestSendSignature(tx, tosigns, signatures, pubkeys);
  // _postRequestCreateNewTx();

  _postRequestSendTx(
      '0100000001a51c23d06af03746b9406ad5f7fe8535e1cf10c597844ed90d0e3bca1a88da42010000006a473044022073671885de307ba731cfc45dec9c370868c744bcb723a42a17e4f491fbe0cf7102200d64909c96f84521633d9f878a8b0669abcd4a2e90dff834fab92c9e6983905d012102433cfc3ea6f3ef96bbb449f5f229f459c1667b5c17cf6f0b101f82614457d077ffffffff02e8030000000000001976a914640de4dc7abf1ced9ef2b4a0b92ed0d5c46eb8ef88acd8d60000000000001976a91484e522c79e681dd46ceb8d9bea0f95a1d857fece88ac00000000');
}
