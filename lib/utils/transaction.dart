import 'package:http/http.dart' as http;
import 'dart:convert';

main() async {
  var response = await http.get(
    Uri.https(
      'api.blockcypher.com',
      '/v1/btc/test3/addrs/mpdzWcEn2gKbtcz9PhHH9cdbw3E5Z7Qo4V/balance',
    ),
  );
  print(json.decode(response.body)['final_balance']);
}
