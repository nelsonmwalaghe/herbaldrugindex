import 'dart:math';

import 'package:flutter/material.dart';
import 'package:herbalcodexslytherine/api_service.dart';
import 'package:herbalcodexslytherine/herbaldrugmodel.dart';
import 'package:herbalcodexslytherine/search.dart';
import 'package:herbalcodexslytherine/splash_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FetchHerbaldrug _herbaldrugList = FetchHerbaldrug();
  int _imageIdx = 0;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _imageIdx = Random().nextInt(Config.splashScreenImageList.length);
    return SafeArea(
      child: Scaffold(floatingActionButton:FloatingActionButton(onPressed: () {
        showSearch(context: context, delegate: SearchHerbaldrug());
      },isExtended: true,
        child: Icon(Icons.search_outlined),
        
        
         ),
        drawer: Drawer(
        shadowColor: Colors.black.withOpacity(.2),

      ),
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Row(
            children: [
              Text(
                'HERBAL',
                style: TextStyle(color: Colors.green),
              ),
              Text(
                'DRUG',
                style: TextStyle(color: Colors.red),
              ),
              Text('INDEX', style: TextStyle(color: Colors.blue)),
              CircleAvatar(
                backgroundImage: AssetImage('mortar.jpg'),
                radius: 20.0,
              )
            ],
          ),

          ),
        body: Container(padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Config.splashScreenImageList[_imageIdx]),fit: BoxFit.cover
            ),
          ),
          
          child: FutureBuilder<List<Herbaldruglist>>(
              future: _herbaldrugList.getHerbaldrugList(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return Card(color: Colors.white.withOpacity(.5),
                      child: ListTile(
                        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(color: Colors.green,elevation: 8, shadowColor: Colors.green,
                              child: Text(
                                '${data?[index].englishCommonNameOfHerbalSubstance}',
                                style: TextStyle(
                                    wordSpacing: 2.0,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                                softWrap: true,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Botanical Name: ',
                                      style: TextStyle(
                                          wordSpacing: 2.0,
                                          color: Colors.brown,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      softWrap: true,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${data?[index].botanicalNameOfPlant}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                            color: Colors.black),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Latin Name: ',
                                      style: TextStyle(
                                          wordSpacing: 2.0,
                                          color: Colors.blue,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      softWrap: true,
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
                                        '${data?[index].latinNameOfHerbalSubstance}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                            color: Colors.black),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Use: ',
                                      style: TextStyle(
                                          wordSpacing: 2.0,
                                          color: Colors.red,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text('${data?[index].use}',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black),
                                          softWrap: true),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
