import 'package:flutter/material.dart';
import 'package:hw1/models/favorite.dart';
import 'package:hw1/screens/favorite_screen.dart';
import 'package:hw1/screens/news_list_screen.dart';

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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            bottom: const TabBar(
              tabs: [
                Tab(text: "Новости"),
                Tab(text: "Избранное"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              NewsListScreen(favoriteNewsModel: favoriteNewsModel),
              FavoritesScreen(favoriteNewsModel: favoriteNewsModel),
            ],
          ),
        ),
      ),
    );
  }
}
