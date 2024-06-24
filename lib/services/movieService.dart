import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/models/movieDateModel.dart';
import 'package:movie/models/moviedataDetailsModel.dart';

class MovieService {
  static Future<List<MovieDataModel>>  fetchMovie (String name) async{
    http.Response response = await http.get(Uri.parse("https://www.omdbapi.com/?s=$name&apikey=d13360e2"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataKey = jsonResponse['Search'];
      List<MovieDataModel> newData = MovieDataModel.listFromJson(dataKey);
      print(newData);
      return newData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }

  static Future<List<MoviedataDetails>>  fetchMovieDetails (String id) async{
    http.Response response = await http.get(Uri.parse("https://www.omdbapi.com/?i=$id&apikey=d13360e22"));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<MoviedataDetails> newData = MoviedataDetails.listFromJson(jsonResponse);
      print(newData);
      return newData;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}