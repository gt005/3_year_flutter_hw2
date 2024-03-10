import 'package:flutter/material.dart';
import 'package:hw1/models/favorite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hw1/widgets/news_feed_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final favoriteNewsModel = FavoriteNewsModel();
  await favoriteNewsModel.loadFavorites();

  runApp(NewsFeedApp(favoriteNewsModel: favoriteNewsModel));
}
