import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw1/models/favorite.dart';
import 'package:hw1/models/news.dart';
import 'package:hw1/widgets/favorite_button.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Добавление новости в избранное', (WidgetTester tester) async {
    final testNews = News(
      title: 'Test News',
      description: 'Test Description',
      content: 'Test Content',
      publishedAt: '2021-04-23',
      urlToImage: 'https://example.com/image.jpg',
      articleUrl: 'https://example.com',
    );

    final favoriteNewsModel = FavoriteNewsModel();

    await tester.pumpWidget(MaterialApp(
      home: Provider<FavoriteNewsModel>.value(
        value: favoriteNewsModel,
        child: FavoriteIconWidget(
            news: testNews, favoriteNewsModel: favoriteNewsModel),
      ),
    ));

    await tester.tap(find.byType(IconButton));
    await tester.pump();

    expect(favoriteNewsModel.isFavorite(testNews), isTrue);
  });
}
