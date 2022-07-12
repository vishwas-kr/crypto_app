
import 'package:http/http.dart' as http;

class CryptoAPI {
  Future cryptoApi() async {
    const Map<String, String> headers = {
      'X-RapidAPI-Key':
          'coinranking1de5bba53eb361c7492d968d3310133ce6fbd3d357cb819e',
    };

    final response = await http.get(
      Uri.parse("https://api.coinranking.com/v2/coins"),
      headers: headers,
    );

    var body = response.body;
   // print(body);
    return body;
  }
}
