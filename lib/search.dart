import 'package:flutter/material.dart';
import 'package:herbalcodexslytherine/api_service.dart';
import 'package:herbalcodexslytherine/herbaldrugmodel.dart';
import 'package:herbalcodexslytherine/splash_screen.dart';

class SearchHerbaldrug extends SearchDelegate{

  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(icon: Icon(Icons.close),
        onPressed: (){ query = "";
    }, )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon: Icon(Icons.arrow_back));
  }
  FetchHerbaldrug _herbaldrugList = FetchHerbaldrug();

  int _imageIdx = 0;

  @override
  Widget buildResults(BuildContext context) {
    return SafeArea(
      child: Scaffold(drawer: Drawer(),
        body: Container(padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Config.splashScreenImageList[_imageIdx]),fit: BoxFit.cover
            ),
          ),
          child: FutureBuilder<List<Herbaldruglist>>(
                future: _herbaldrugList.getHerbaldrugList(query: query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search Herbal Drug'),
    );
  }
}