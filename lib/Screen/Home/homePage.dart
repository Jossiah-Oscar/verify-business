// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.amberAccent,
        actions: [
          ElevatedButton(
            onPressed: () async {
              var headers = {
                'Authorization': 'Bearer sk_oKuwiBKpfUDxWz',
                'Content-Type': 'application/json'
              };
              var request = http.Request(
                  'POST', Uri.parse('https://api.shoket.co/v1/charge/'));
              request.body = json.encode({
                "amount": "200",
                "customer_name": "Jossiah Kibona",
                "email": "jossiahoscar@gmail.com",
                "number_used": "255742223432",
                "channel": "Vodacom"
              });
              request.headers.addAll(headers);

              http.StreamedResponse response = await request.send();

              if (response.statusCode == 200) {
                print(await response.stream.bytesToString());
              } else {
                print(response.statusCode);
                print("object");
              }
            },
            child: Text(
              "Register Business",
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          height: heights,
          width: widths,
          color: Colors.amberAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: heights * 0.06,
                width: widths * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  controller: searchController,
                ),
              ),
              SizedBox(
                height: heights * 0.02,
              ),
              Text("Verify Instagram Business"),
            ],
          ),
        ),
      ),
    );
  }
}
