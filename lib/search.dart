import 'package:flutter/material.dart';
import 'package:herbalcodexslytherine/api_service.dart';
import 'package:herbalcodexslytherine/herbaldrugmodel.dart';

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

  @override
  Widget buildResults(BuildContext context) {
    return Container(
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
                return Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    '${data?[index].englishCommonNameOfHerbalSubstance}',
                                    style: TextStyle(wordSpacing: 2.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),),
                        ),
                        SizedBox(width: 10),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Botanical Name: '),
                                Text('${data?[index].botanicalNameOfPlant}',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Latin Name: '),
                                Text('${data?[index].latinNameOfHerbalSubstance}'),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Use: '),
                                Text('${data?[index].use}'),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Search Herbal Drug'),
    );
  }
}