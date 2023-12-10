import 'package:flutter/material.dart';
import 'package:herbalcodexslytherine/api_service.dart';
import 'package:herbalcodexslytherine/herbaldrugmodel.dart';
import 'package:herbalcodexslytherine/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FetchHerbaldrug _herbaldrugList = FetchHerbaldrug();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'Herbal',
                style: TextStyle(color: Colors.green),
              ),
              Text(
                'DRUG',
                style: TextStyle(color: Colors.red),
              ),
              Text('index', style: TextStyle(color: Colors.blue)),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchHerbaldrug());
              },
            )
          ],
        ),
        body: Container(
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
                    return Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data?[index].englishCommonNameOfHerbalSubstance}',
                              style: TextStyle(
                                  wordSpacing: 2.0,
                                  color: Colors.green,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                              softWrap: true,
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
                                          fontSize: 16.0, fontWeight: FontWeight.bold),
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
                                    Text('Latin Name: ',style: TextStyle(
                                        wordSpacing: 2.0,
                                        color: Colors.blue,
                                        fontSize: 16.0, fontWeight: FontWeight.bold),
                                      softWrap: true,),
                                    Text(
                                        '${data?[index].latinNameOfHerbalSubstance}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                            color: Colors.black),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Use: ', style: TextStyle(
                                        wordSpacing: 2.0,
                                        color: Colors.red,
                                        fontSize: 16.0, fontWeight: FontWeight.bold),
                                     ),
                                    Flexible(fit: FlexFit.loose,
                                      child: Text('${data?[index].use}',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black),
                                          softWrap: true
                                      ),
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
