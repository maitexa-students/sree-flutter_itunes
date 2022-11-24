import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_itunes/model/results.dart';




class APIService{

  Future <List<ItunesResults>> getResults(String? searchTerm) async{
    final url ='https://itunes.apple.com/search?term={$searchTerm}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      var body = json.decode(response.body);
      List<ItunesResults> listdata =  List<ItunesResults>.from(
          body['results'].map((e)=> ItunesResults.fromJson(e)).toList()
      );
      return listdata;
    }else{
      List<ItunesResults> listdata =[];
      return listdata;
    }
  }
}