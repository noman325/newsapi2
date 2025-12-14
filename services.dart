import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets/newmodel.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  List<NewsModel> dataStore = [];
  Future<void> getNews() async {
    Uri url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4ee32f4c3fa64128932c2061b7789ecb',
    );

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['title'] != null &&
            element['urlToImage'] != null &&
            element['description'] != null &&
            element['author'] != null &&
            element['content'] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],

            urlToImage: element['urlToImage'],

            author: element['author'],
            description: element['description'],
            content: element['content'],
          );
          dataStore.add(newsModel);
        }
      });
      print('✅ Total Articles: ${dataStore.length}');
    }
  }
}
