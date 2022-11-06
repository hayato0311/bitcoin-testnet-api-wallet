import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

const int confirmationsCountTh = 6;

class BlockcypherApi {
  static Future<Map<String, dynamic>> getAccountFullData(address,
      {testnet = false}) async {
    late String environment;
    if (testnet) {
      environment = 'test3';
    } else {
      environment = 'main';
    }
    var response = await http.get(
      Uri.https(
        'api.blockcypher.com',
        '/v1/btc/$environment/addrs/$address/full',
      ),
    );

    return json.decode(response.body);
  }
}

Map<String, dynamic> txHistoryProcessing(myAddress, txHistory) {
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
  if (confirmationsCount < confirmationsCountTh) {
    status = 'in proggress';
  }
  // TODO: process this DateTime format.
  String confirmedAt = '';
  if (txHistory.keys.contains('confirmed')) {
    confirmedAt = txHistory['confirmed'];
  }

  return <String, dynamic>{
    'valueSatoshi': valueSatoshi,
    'valueBtc': valueBtc,
    'txType': txType,
    'status': status,
    'partnerAddressLabel': partnerAddressLabel,
    'confirmedAt': confirmedAt,
  };
}
