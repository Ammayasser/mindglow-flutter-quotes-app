class LoveQuote {
  final String quote;
  final String author;
  final String category;
  bool isFavorite;

  LoveQuote({
    required this.quote,
    required this.author,
    required this.category,
    this.isFavorite = false,
  });

  factory LoveQuote.fromJson(Map<String, dynamic> json) {
    return LoveQuote(
      quote: json['quote'] ?? '',
      author: json['author'] ?? '',
      category: json['category'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quote': quote,
      'author': author,
      'category': category,
      'isFavorite': isFavorite,
    };
  }
}
