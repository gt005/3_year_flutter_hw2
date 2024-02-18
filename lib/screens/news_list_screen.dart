import 'package:flutter/material.dart';
import 'package:hw1/models/news.dart';
import 'package:hw1/services/api_service.dart';
import 'package:hw1/widgets/load_more_button.dart';
import 'package:hw1/widgets/news_tile.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  NewsListScreenState createState() => NewsListScreenState();
}

class NewsListScreenState extends State<NewsListScreen> {
  final List<News> _newsList = [];
  bool _isLoading = false;
  int _currentPage = 1;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _loadMoreNews();
  }

  void _loadMoreNews() async {
    setState(() {
      _isLoading = true;
    });
    final List<News> newsList = await _apiService.fetchTopHeadlines(page: _currentPage);
    setState(() {
      _newsList.addAll(newsList);
      _isLoading = false;
      _currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Новостная лента"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _newsList.length + 1,
              itemBuilder: (context, index) {
                if (index < _newsList.length) {
                  final news = _newsList[index];
                  return NewsTile(news: news);
                } else {
                  return LoadMoreButton(onPressed: _isLoading ? null : _loadMoreNews);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
