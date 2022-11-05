// import 'dart:math';
// import 'dart:convert';
// import 'package:bitcoin_flutter/bitcoin_flutter.dart';
// import 'package:bip39/bip39.dart' as bip39;

// // Utf8Codec rng() {
// //   return utf8.encode(Random.secure());
// // }

// String address({compressed = true, testnet = false}) {
//   String randomMnemonic = bip39.generateMnemonic();
//   // final testnet = NetworkType(
//   //   messagePrefix: '\x18Bitcoin Signed Message:\n',
//   //   bech32: 'tb',
//   //   bip32: Bip32Type(public: 0x043587cf, private: 0x04358394),
//   //   pubKeyHash: 0x6f,
//   //   scriptHash: 0xc4,
//   //   wif: 0xef,
//   // );
//   // final keyPair = ECPair.makeRandom(network: testnet, rng: rng);
//   // final wif = keyPair.toWIF();
//   // final address = new P2PKH(
//   //         data: new PaymentData(pubkey: keyPair.publicKey), network: testnet)
//   //     .data
//   //     .address;

//   final seed = bip39.mnemonicToSeed(
//       'praise you muffin lion enable neck grocery crumble super myself license ghost');
//   print(seed);
//   print(bip39.validateMnemonic(randomMnemonic));
//   var hdWallet = HDWallet.fromSeed(seed);
//   print(hdWallet.address);
//   // => 12eUJoaWBENQ3tNZE52ZQaHqr3v4tTX4os
//   print(hdWallet.pubKey);
//   // => 0360729fb3c4733e43bf91e5208b0d240f8d8de239cff3f2ebd616b94faa0007f4
//   print(hdWallet.privKey);
//   // => 01304181d699cd89db7de6337d597adf5f78dc1f0784c400e41a3bd829a5a226
//   print(hdWallet.wif);
//   // => KwG2BU1ERd3ndbFUrdpR7ymLZbsd7xZpPKxsgJzUf76A4q9CkBpY
//   return "aaa";
// }
