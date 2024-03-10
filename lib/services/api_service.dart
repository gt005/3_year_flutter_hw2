import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/news.dart';

class ApiService {
  final String _baseUrl = "https://newsapi.org/v2/top-headlines";
  final String _apiKey = dotenv.env['NEWS_API_KEY']!;

  Future<List<News>> fetchTopHeadlines(
      {String country = 'us', int page = 1, int pageSize = 10}) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?country=$country&page=$page&pageSize=$pageSize'),
      headers: {'X-Api-Key': _apiKey},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      final List<dynamic> articles = json['articles'];
      return articles.map((article) => News.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
