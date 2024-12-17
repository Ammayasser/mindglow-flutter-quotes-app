import 'package:flutter/foundation.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';
import '../services/storage_service.dart';

class QuoteProvider with ChangeNotifier {
  final QuoteService _quoteService = QuoteService();
  late final StorageService _storageService;
  List<Quote> _quotes = [];
  List<Quote> _favorites = [];
  bool _isLoading = false;
  String? _error;
  String _selectedTopic = 'General';

  List<Quote> get quotes => _quotes;
  List<Quote> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedTopic => _selectedTopic;

  QuoteProvider() {
    _initStorageService();
  }

  Future<void> _initStorageService() async {
    _storageService = await StorageService.init();
    await loadFavorites();
  }

  Future<void> loadFavorites() async {
    _favorites = await _storageService.loadFavorites();
    // Update isFavorite status for current quotes
    for (var quote in _quotes) {
      quote.isFavorite = _favorites
          .any((f) => f.text == quote.text && f.author == quote.author);
    }
    notifyListeners();
  }

  Future<void> fetchNewQuote() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final quote = await _quoteService.getRandomQuote();
      // Check if quote is in favorites
      quote.isFavorite = await _storageService.isFavorite(quote);
      _quotes.add(quote);
      _error = null;
    } catch (e) {
      _error = e.toString();
      print('Provider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFavorite(int index) async {
    if (index < _quotes.length) {
      final quote = _quotes[index];
      quote.isFavorite = !quote.isFavorite;
      await _storageService.toggleFavorite(quote);
      await loadFavorites(); // Reload favorites to sync the lists
      notifyListeners();
    }
  }

  Future<void> toggleDeepQuoteFavorite(Quote quote) async {
    quote.isFavorite = !quote.isFavorite;
    await _storageService.toggleFavorite(quote);
    await loadFavorites(); // Reload favorites to sync the lists
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }

  void selectTopic(String topic) {
    _selectedTopic = topic;
    notifyListeners();
  }

  bool isTopicSelected(String topic) {
    return _selectedTopic == topic;
  }
}
