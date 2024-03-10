import 'package:flutter/material.dart';
import 'package:hw1/models/favorite.dart';
import 'package:hw1/widgets/favorite_button.dart';
import '../models/news.dart';
import '../screens/news_detail_screen.dart';
import '../styles/dimensions.dart';

class NewsTile extends StatelessWidget {
  final News news;
  final FavoriteNewsModel favoriteNewsModel;

  const NewsTile(
      {super.key, required this.news, required this.favoriteNewsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailScreen(
                    news: news, favoriteNewsModel: favoriteNewsModel),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: AppDimensions.small),
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
                  Image.network(
                    news.urlToImage,
                    width: double.infinity,
                    height: AppDimensions.medium,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: double.infinity,
                        height: AppDimensions.medium,
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.all(AppDimensions.small),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(news.description),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 5,
          child: FavoriteIconWidget(
              news: news, favoriteNewsModel: favoriteNewsModel),
        ),
      ],
    );
  }
}
