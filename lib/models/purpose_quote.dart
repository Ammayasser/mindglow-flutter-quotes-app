class PurposeQuote {
  final String quote;
  final String author;
  final String category;
  bool isFavorite;

  PurposeQuote({
    required this.quote,
    required this.author,
    required this.category,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'quote': quote,
      'author': author,
      'category': category,
      'isFavorite': isFavorite,
    };
  }

  factory PurposeQuote.fromJson(Map<String, dynamic> json) {
    return PurposeQuote(
      quote: json['quote'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
      isFavorite: json['isFavorite'] as bool,
    );
  }
}
