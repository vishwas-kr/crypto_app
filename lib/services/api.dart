import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/crypto_symbol.dart';

// class API {
//   static final key = "x2KcbP5bTAUrJ7r7Bgk2";

//   static Future getCryptoSymbolDetails() async {
//     final url =
//         "https://fcsapi.com/api-v3/crypto/list?type=crypto&access_key=$key";
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final response = await http.get(Uri.parse(url));

//         var body = await jsonDecode(response.body);
//         print(body);

//         CryptoSymbol symbol = CryptoSymbol.fromJson(body);
//         return symbol;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return e;
//     }
//   }
// }

class CryptoAPI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
    'Authorization': "test"
  };

  Future getData() async {
    final Uri uri = Uri.parse('https://api.coincap.io/v2/assets');
    final http.Response response = await client.get(
      uri,
      headers: headers,
    );
    final dynamic body = response.body;
    return body;
  }
}
