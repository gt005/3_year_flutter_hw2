import 'package:flutter/material.dart';
import 'package:hw1/models/favorite.dart';
import 'package:hw1/widgets/news_tile.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoriteNewsModel favoriteNewsModel;

  const FavoritesScreen({super.key, required this.favoriteNewsModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable: favoriteNewsModel.favoriteNewsNotifier,
      builder: (context, value, child) {
        var favorites = favoriteNewsModel.getFavorites();
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final news = favorites[index];
            return NewsTile(news: news, favoriteNewsModel: favoriteNewsModel);
          },
        );
      },
    );
  }
}
