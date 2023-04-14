import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

import '../classes/trendy.dart';

class Provider1 extends ChangeNotifier {
  final dio = Dio();
  String? apiKey = "7ed5243fa99045f991ef3fec424005aa";
  // calling trendy news:
 Future<List<Trendy>> trendyNews() async {
    final response = await dio.get('https://newsapi.org/v2/top-headlines?country=us&pageSize=10&apiKey=$apiKey');

    
    if (response.statusCode == 200) {
    final data = response.data['articles'] as List;
    List<Trendy> newsList = data.map((json) => Trendy.fromJson(json)).toList();
    return newsList;
  } else {
    throw Exception('Failed to load news');
  }
  }

 




  notifyListeners();
}