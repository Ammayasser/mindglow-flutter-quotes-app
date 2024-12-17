class ShortQuote {
  final String text;
  final String author;
  final String category;

  ShortQuote({
    required this.text,
    required this.author,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
      'category': category,
    };
  }

  factory ShortQuote.fromJson(Map<String, dynamic> json) {
    return ShortQuote(
      text: json['text'] as String,
      author: json['author'] as String,
      category: json['category'] as String,
    );
  }
}
