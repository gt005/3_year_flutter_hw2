import 'package:flutter/material.dart';
import 'package:hw1/models/favorite.dart';
import 'package:hw1/screens/news_list_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final favoriteNewsModel = FavoriteNewsModel();
  await favoriteNewsModel.loadFavorites();

  runApp(NewsFeedApp(favoriteNewsModel: favoriteNewsModel));
}

class NewsFeedApp extends StatelessWidget {
  final FavoriteNewsModel favoriteNewsModel;

  const NewsFeedApp({super.key, required this.favoriteNewsModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: NewsListScreen(favoriteNewsModel: favoriteNewsModel),
    );
  }
}
