import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw1/models/favorite.dart';
import 'package:hw1/models/news.dart';
import 'package:hw1/widgets/favorite_button.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Add news to favorites', (WidgetTester tester) async {
    final FavoriteNewsModel favoriteNewsModel = FavoriteNewsModel();
    final News news = News(
      title: 'Test News',
      description: 'Test Description',
      content: 'Test Content',
      publishedAt: '2022-04-01',
      urlToImage: 'http://example.com/image.jpg',
      articleUrl: 'http://example.com',
    );

    await tester.pumpWidget(MaterialApp(
      home: Provider<FavoriteNewsModel>.value(
        value: favoriteNewsModel,
        child: FavoriteIconWidget(
            news: news, favoriteNewsModel: favoriteNewsModel),
      ),
    ));

    expect(find.byIcon(Icons.star_border), findsOneWidget);
    expect(find.byIcon(Icons.star), findsNothing);

    await tester.tap(find.byIcon(Icons.star_border));
    await tester.pump();

    expect(find.byIcon(Icons.star), findsOneWidget);
    expect(find.byIcon(Icons.star_border), findsNothing);
  });
}
