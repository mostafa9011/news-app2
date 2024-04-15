import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:news/core/config/constants.dart';
import 'package:news/models/articles_data_model.dart';
import 'package:news/models/source_model.dart';

class ApiMAanager {


  static Future<List<SourceModel>> fetchDataSources(String categoryId) async {
    var url = Uri.https(
      Constants.baseUrl,
      "/v2/top-headlines/sources",
      {
        "apiKey": Constants.apiKey,
        "category": categoryId,
      },
    );
    final response = await http.get(url);

    List<SourceModel> sourcesDataList = [];

    if (response.statusCode == 200) {
      log(response.body);
      var data = jsonDecode(response.body);
      var sourcesList = data["sources"] as List;

      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.fromJson(element));
      }
      return sourcesDataList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  static Future<List<Articles>> fetchDataArticles(String sourceId) async {

    Map<String, dynamic> queryParams = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };

    var url = Uri.https(
      Constants.baseUrl,
      "/v2/everything",
      queryParams
    );

    final response = await http.get(url);

    if(response.statusCode == 200) {

      var data = jsonDecode(response.body);
      // List articlesList = data ["articles"];

      ArticlesDataModel articlesDataModel = ArticlesDataModel.fromJson(data);
      return articlesDataModel.articles ?? [];
    }else {
      throw Exception("Error fetching data articles");
    }

  }
}
