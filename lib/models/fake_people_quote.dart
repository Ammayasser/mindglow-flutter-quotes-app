class FakePeopleQuote {
  final String quote;
  final String author;
  final String category;
  bool isFavorite;

  FakePeopleQuote({
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

  factory FakePeopleQuote.fromJson(Map<String, dynamic> json) {
    return FakePeopleQuote(
      quote: json['quote'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
      isFavorite: json['isFavorite'] as bool,
    );
  }
}
