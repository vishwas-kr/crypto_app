import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/crypto_model.dart';

// class API {
//   static String key = "412368349e2b7d7a69b25612757331a0fd0a1d48";

//   static Future getCryptoDetails() async {
//     try {
//       final response = await http.get(Uri.parse(
//           "https://api.nomics.com/v1/currencies/ticker?key=$key"));
//       if (response.statusCode == 200) {
//         var body = await jsonDecode(response.body);
//         print("HELLO USER BODY IS HERE");
//         print(body[0]["currency"].toString());
//         return body;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return e;
//     }
//   }
// }
