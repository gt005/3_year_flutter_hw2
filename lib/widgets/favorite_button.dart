import 'package:flutter/material.dart';
import 'package:hw1/models/favorite.dart';
import 'package:hw1/models/news.dart';

class FavoriteIconWidget extends StatefulWidget {
  final News news;
  final FavoriteNewsModel favoriteNewsModel;

  const FavoriteIconWidget(
      {super.key, required this.news, required this.favoriteNewsModel});

  @override
  FavoriteIconWidgetState createState() {
    return FavoriteIconWidgetState();
  }
}

class FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: widget.favoriteNewsModel.favoriteNewsNotifier,
      builder: (context, favoriteNewsUrls, child) {
        bool isFavorite = favoriteNewsUrls.contains(widget.news.articleUrl);
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.star : Icons.star_border,
            color: Colors.yellow,
            size: 45,
          ),
          onPressed: () {
            if (isFavorite) {
              widget.favoriteNewsModel.removeFavorite(widget.news);
            } else {
              widget.favoriteNewsModel.addFavorite(widget.news);
            }
          },
        );
      },
    );
  }
}
