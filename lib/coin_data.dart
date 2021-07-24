import 'package:bitcoin_ticker/networking.dart';

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

const apiKey = '6E06D3F2-971C-4A0B-A8EF-10E0538D9B14';
const apiHeader = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  String? currency;

  CoinData({this.currency});

  Future<dynamic> getCoinData() async {
    Networking networking = new Networking(
        api: '$apiHeader/${cryptoList[0]}/$currency?apikey=$apiKey');
    var coinData = await networking.getData();

    return coinData;
  }

  Future<dynamic> getCoinData2() async {
    Networking networking = new Networking(
        api: '$apiHeader/${cryptoList[1]}/$currency?apikey=$apiKey');
    var coinData = await networking.getData();

    return coinData;
  }

  Future<dynamic> getCoinData3() async {
    Networking networking = new Networking(
        api: '$apiHeader/${cryptoList[2]}/$currency?apikey=$apiKey');
    var coinData = await networking.getData();

    return coinData;
  }
}
