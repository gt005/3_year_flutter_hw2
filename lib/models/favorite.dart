import 'package:flutter/material.dart';
import 'package:hw1/models/news.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavoriteNewsModel {
  FavoriteNewsModel._privateConstructor();

  static final FavoriteNewsModel _instance =
      FavoriteNewsModel._privateConstructor();

  ValueNotifier<Set<String>> favoriteNewsNotifier = ValueNotifier({});

  factory FavoriteNewsModel() {
    return _instance;
  }

  final Map<String, News> _favoriteNews = {};

  void addFavorite(News news) {
    _favoriteNews[news.articleUrl] = news;
    saveFavorites();
    favoriteNewsNotifier.value = Set.from(_favoriteNews.keys);
  }

  void removeFavorite(News news) {
    _favoriteNews.remove(news.articleUrl);
    saveFavorites();
    favoriteNewsNotifier.value = Set.from(_favoriteNews.keys);
  }

  bool isFavorite(News news) {
    return _favoriteNews.containsKey(news.articleUrl);
  }

  List<News> getFavorites() {
    return _favoriteNews.values.toList();
  }

  void saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = json.encode(
      _favoriteNews.values.map((news) => news.toJson()).toList(),
    );
    await prefs.setString('favoriteNews', encodedData);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoriteNewsString = prefs.getString('favoriteNews');
    if (favoriteNewsString != null) {
      Iterable decoded = json.decode(favoriteNewsString);
      _favoriteNews.clear();
      for (var newsJson in decoded) {
        News news = News.fromJson(newsJson);
        _favoriteNews[news.articleUrl] = news;
      }
    }
  }
}
