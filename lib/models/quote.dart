class Quote {
  final String text;
  final String author;
  final String? category;
  bool isFavorite;

  Quote({
    required this.text,
    required this.author,
    this.category,
    this.isFavorite = false,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['quote'] ?? 'No quote available',
      author: json['author'] ?? 'Unknown',
      category: json['category'],
    );
  }

  @override
  String toString() {
    return 'Quote{text: $text, author: $author, category: $category, isFavorite: $isFavorite}';
  }
}
