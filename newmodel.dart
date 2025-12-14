import 'package:flutter/material.dart';

class CetagoryModel {
  String? cetegoryName;

  CetagoryModel({this.cetegoryName});
}

class NewsModel {
  String? title;
  String? author;
  String? description;
  String? urlToImage;
  String? content;

  NewsModel({
    this.title,

    this.author,

    this.description,
    this.urlToImage,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
    );
  }
}
