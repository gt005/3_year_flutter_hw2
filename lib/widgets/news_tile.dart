import 'package:flutter/material.dart';
import 'package:hw1/models/news.dart';
import 'package:hw1/screens/news_detail_screen.dart';

class NewsTile extends StatelessWidget {
  final News news;

  const NewsTile({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(news: news),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
            bottom: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (news.urlToImage.isNotEmpty)
              Image.network(news.urlToImage),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(news.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
