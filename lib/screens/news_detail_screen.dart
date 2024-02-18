import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news.dart';


class NewsDetailScreen extends StatelessWidget {
  final News news;

  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (news.urlToImage.isNotEmpty)
              Image.network(news.urlToImage),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.description),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(news.content),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri url = Uri.parse(news.articleUrl);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
