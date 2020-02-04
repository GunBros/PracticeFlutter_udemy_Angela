import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future<Map<String, double>> getCoinData(String selectedCurrency) async {
    Map<String, double> cryptoData = {};
    for (String crypto in cryptoList) {
      String requestURL = '$bitcoinAverageURL/$crypto$selectedCurrency';
      http.Response response = await http.get(requestURL,
          headers: {'x-ba-key': 'M2NhOGUwZDg0ZTllNGQ2ZWExMzg2MTQ3MzFiMTc4NmM'});
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['last'];
        cryptoData[crypto] = lastPrice;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoData;
  }
}
