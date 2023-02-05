import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prectic/model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Welcome> welcome = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: geData(),
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: welcome.length,
                itemBuilder: (context, i) {
                  return Expanded(
                    child: Container(
                      height: 600,
                      color: Colors.green,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Name of news artical :- ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                      ' ${welcome[i].name.first} ${welcome[i].name.middle} ${welcome[i].name.last}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Gender :- ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(' ${welcome[i].gender}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'ID :- ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(' ${welcome[i].id}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Age :- ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(' ${welcome[i].age}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'HomePlanet :- ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(' ${welcome[i].homePlanet}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Occupation :- ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(' ${welcome[i].occupation}'),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 300,
                                width: 360,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            welcome[i].images.main))),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                color: Colors.greenAccent,
                                height: 100,
                                width: 390,
                                child: Expanded(
                                    child: SingleChildScrollView(
                                        child: Text(' ${welcome[i].sayings}'))),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                height: 10,
                                thickness: 1,
                                endIndent: 10,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Welcome>> geData() async {
    final response = await http
        .get(Uri.parse('https://api.sampleapis.com/futurama/characters'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        welcome.add(Welcome.fromJson(index));
        print(welcome);
      }
      return welcome;
    } else {
      return welcome;
    }
  }
}
