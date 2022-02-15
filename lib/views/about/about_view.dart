import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:the_basics/env.sample.dart';
import 'package:the_basics/model/Water.dart';

class AboutView extends StatefulWidget {
  @override
  AboutViewState createState() => AboutViewState();
}

class AboutViewState extends State<AboutView> {
  Future<List<Aqua>> Aquas;
  final AquaListKey = GlobalKey<AboutViewState>();

  @override
  void initState() {
    super.initState();
    Aquas = getAquaList();
  }

  Future<List<Aqua>> getAquaList() async {
    final response =
        await http.get(Uri.parse("${Env.URL_PREFIX}/employeedetails"));

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    List<Aqua> Aquas = items.map<Aqua>((json) {
      return Aqua.fromJson(json);
    }).toList();

    return Aquas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AquaListKey,
      appBar: AppBar(
        title: Text('Aqua List'),
      ),
      body: Center(
        child: FutureBuilder<List<Aqua>>(
          future: Aquas,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // By default, show a loading spinner.
            if (!snapshot.hasData) return CircularProgressIndicator();
            // Render Aqua lists
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      data.ename,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
