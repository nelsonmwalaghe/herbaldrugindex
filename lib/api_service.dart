import 'dart:convert';
import 'package:herbalcodexslytherine/herbaldrugmodel.dart';
import 'package:http/http.dart' as http;

class FetchHerbaldrug{
  var data = [];
    List<Herbaldruglist> results = [];

   String fetchurl = "https://script.google.com/macros/s/AKfycbxHQNxtJPxy31OadMW9DHhPEnXsTJrOLoVx1_jzRqS_mmjvYOXuBuNO12IJ4xQzlW7x6g/exec";
   Future<List<Herbaldruglist>> getHerbaldrugList({String? query}) async {
      var url = Uri.parse(fetchurl);
      var response = await http.get(url);
      try {
        if(response.statusCode == 200){
          data = json.decode(response.body);
        results = data.map((e) => Herbaldruglist.fromJson(e)).toList();
        if(query != null){
          results = results.where((element) => element.englishCommonNameOfHerbalSubstance!.toLowerCase().contains(query.toLowerCase())).toList();
        }
        }else{
          print('api error');
        }
      } on Exception catch (e) {
        print('error: $e');
      }
      return results;
   }
}