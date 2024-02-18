class News {
  final String title;
  final String description;
  final String content;
  final String publishedAt;
  final String urlToImage;
  final String articleUrl;

  News({
    required this.title,
    required this.description,
    required this.content,
    required this.publishedAt,
    required this.urlToImage,
    required this.articleUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      articleUrl: json['url'] ?? '',
    );
  }
}
