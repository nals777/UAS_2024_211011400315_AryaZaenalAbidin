import 'dart:convert';
import 'package:http/http.dart' as http;
import 'crypto_model.dart';

class CryptoApi {
  static Future<List<Crypto>> fetchCryptos() async {
    final response =
        await http.get(Uri.parse('https://api.coinlore.net/api/tickers/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((json) => Crypto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cryptos');
    }
  }
}
