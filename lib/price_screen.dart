import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  int price1 = 0, price2 = 0, price3 = 0;
  String prices1 = '?', prices2 = '?', prices3 = '?';

  void updatedUI(String currency) async {
    CoinData coinData = new CoinData(currency: currency);
    var coinDatas = await coinData.getCoinData();
    var coinDatas2 = await coinData.getCoinData2();
    var coinDatas3 = await coinData.getCoinData3();

    setState(() {
      selectedCurrency = coinDatas['asset_id_quote'];
      price1 = coinDatas['rate'].toInt();
      prices1 = price1.toString();

      price2 = coinDatas2['rate'].toInt();
      prices2 = price2.toString();

      price3 = coinDatas3['rate'].toInt();
      prices3 = price3.toString();
    });
  }

  DropdownButton<String> getAndroid() {
    List<DropdownMenuItem<String>> a = [];

    for (String currency in currenciesList) {
      var dropDownMenuItemCurrency = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      a.add(dropDownMenuItemCurrency);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: a,
      onChanged: (value) {
        updatedUI(value!);
      },
    );
  }

  CupertinoPicker getIOS() {
    List<Text> a = [];
    for (String currency in currenciesList) {
      a.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: a,
    );
  }

  @override
  Widget build(BuildContext context) {
    CoinData coinData = new CoinData();
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 BTC = $prices1 $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ETH = $prices2 $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 LTC = $prices3 $selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? getIOS() : getAndroid(),
          ),
        ],
      ),
    );
  }
}
