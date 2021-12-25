// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:astro_tak/API/astro_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AstroPage extends StatelessWidget {
  const AstroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AstroAPI>().fetchdata;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'assets/hamburger.png',
              height: 40,
            ),

            //  margin: const EdgeInsets.only(right: 75),
            Image.asset(
              'assets/logo.png',
              height: 40,
            ),

            Image.asset(
              'assets/profile.png',
              height: 40,
            )
          ],
        ),
      ),
      body: Stack(children: [
        RefreshIndicator(
          onRefresh: () async {},
          child: Center(
              child: Consumer<AstroAPI>(builder: (context, value, child) {
            return value.map.isEmpty && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text('Oops Something Went Wrong')
                    : ListView.builder(
                        itemCount: value.map['data'].length,
                        itemBuilder: (context, index) {
                          return AstroCard(map: value.map['data'][index]);
                        },
                      );
          })),
        ),
        topbar(),
      ]),
    );
  }
}

class AstroCard extends StatelessWidget {
  const AstroCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),

              blurRadius: 7,
              // changes position of shadow
            ),
          ],
        ),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    (map['images']['medium']['imageUrl'] == null)
                        ? Container(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator())
                        : Image.network(
                            '${map['images']['medium']['imageUrl']}',
                            height: 100,
                            width: 100,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${map['firstName']} ${map['lastName']}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('${map['skills'][0]['name']}'),
                                  Text('${map['languages'][0]['name']}'),
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text('${map['experience']}' ' years of experience'),
                ),

                // Text(
                //   '${map['firstName']} ${map['lastName']}',
                //   style: TextStyle(fontSize: 20),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget topbar() {
  return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Astro',
              style: TextStyle(fontSize: 20),
            ),
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
      ));
}

Widget call() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.call,
            size: 30,
            color: Colors.black,
          ),
          Text(
            'Call',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
