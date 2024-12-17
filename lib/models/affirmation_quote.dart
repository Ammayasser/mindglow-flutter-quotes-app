import 'package:flutter/foundation.dart';

class AffirmationQuote {
  final String text;
  final String author;
  final String category;
  bool isFavorite;

  AffirmationQuote({
    required this.text,
    required this.author,
    required this.category,
    this.isFavorite = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
      'category': category,
      'isFavorite': isFavorite,
    };
  }

  factory AffirmationQuote.fromJson(Map<String, dynamic> json) {
    return AffirmationQuote(
      text: json['text'] ?? '',
      author: json['author'] ?? 'Anonymous',
      category: json['category'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
