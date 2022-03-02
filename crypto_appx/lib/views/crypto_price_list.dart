import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/my_home_page_controller.dart';

import 'dart:io';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';

class CryptoPriceList extends StatefulWidget {
  const CryptoPriceList({Key? key}) : super(key: key);

  @override
  _CryptoPriceListState createState() => _CryptoPriceListState();
}

class _CryptoPriceListState extends State<CryptoPriceList> {
  String url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  List data = [];

  Future makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata;
    });

    //print(data[i]["name"]);
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.tune_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          TextButton(
            child: Text(
              'Sort/Filter',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          var percentChange = data[i]["price_change_percentage_24h"].toString();

          var priceChangeAmount =
              (data[i]["ath_change_percentage"].toStringAsFixed(2));
          var lastUpdated = data[i]["last_updated"];
          var backgroundImage = data[i]["image"];

          var coinName = data[i]["name"];
          return new ListTile(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: const [
                      Center(
                          child: Text(
                        "Sent",
                        style: TextStyle(color: Colors.redAccent),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        percentChange,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      new Text(
                        coinName,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Text(
                '\$' + priceChangeAmount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(lastUpdated),
              leading: Container(
                height: 50.0,
                width: 50.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircleAvatar(
                    radius: 72.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: new NetworkImage(
                      backgroundImage,
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}

//Hello Sister Lolade
