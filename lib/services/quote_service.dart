import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/quote.dart';

class QuoteService {
  static const String _baseUrl =
      'https://api.api-ninjas.com/v1/quotes?category=inspirational';
  static const String _apiKey = '05TkPPIwJ/ZDXWlFMF2Ayg==fU2oMGyFkTxLE9pz';

  Future<Quote> getRandomQuote() async {
    try {
      print('Fetching quote from $_baseUrl'); // Debug print
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'X-Api-Key': _apiKey,
          'Accept': 'application/json',
        },
      );

      print('Response status: ${response.statusCode}'); // Debug print
      print('Response body: ${response.body}'); // Debug print

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          final quoteData = data[0];
          print('Quote data: $quoteData'); // Debug print
          return Quote.fromJson(quoteData);
        } else {
          throw Exception('No quote received');
        }
      } else {
        throw Exception('Failed to load quote: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching quote: $e'); // Debug print
      throw Exception('Failed to fetch quote: $e');
    }
  }
}
