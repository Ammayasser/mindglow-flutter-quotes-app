import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quote.dart';
import '../models/mental_toughness_quote.dart';
import '../services/mental_toughness_quotes_service.dart';
import '../providers/quote_provider.dart';
import '../widgets/custom_snackbar.dart';

class MentalToughnessQuotesScreen extends StatefulWidget {
  const MentalToughnessQuotesScreen({Key? key}) : super(key: key);

  @override
  State<MentalToughnessQuotesScreen> createState() => _MentalToughnessQuotesScreenState();
}

class _MentalToughnessQuotesScreenState extends State<MentalToughnessQuotesScreen> {
  late List<Quote> quotes;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Convert MentalToughnessQuotes to regular Quotes
    List<MentalToughnessQuote> mentalToughnessQuotes = MentalToughnessQuotesService.getAllQuotes();
    quotes = mentalToughnessQuotes.map((mtq) => Quote(
      text: mtq.quote,
      author: mtq.author,
      isFavorite: false,
    )).toList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleFavorite(QuoteProvider quoteProvider, Quote quote, int index) async {
    // Add quote to main quotes list if not already there
    if (!quoteProvider.quotes.any((q) => 
        q.text == quote.text && q.author == quote.author)) {
      quoteProvider.quotes.add(quote);
    }
    
    // Find the quote index in the main quotes list
    final mainIndex = quoteProvider.quotes.indexWhere((q) => 
        q.text == quote.text && q.author == quote.author);
    
    if (mainIndex != -1) {
      // Store the current favorite state
      final willBeFavorite = !quote.isFavorite;
      
      await quoteProvider.toggleFavorite(mainIndex);
      setState(() {}); // Refresh UI
      
      if (!mounted) return;
      
      // Show snackbar with undo functionality
      showCustomSnackBar(
        context,
        willBeFavorite,
        () async {
          await quoteProvider.toggleFavorite(mainIndex);
          setState(() {}); // Refresh UI
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode 
          ? const Color.fromARGB(255, 27, 25, 25)
          : Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Mental Toughness Quotes',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        backgroundColor: isDarkMode 
            ? const Color.fromARGB(255, 27, 25, 25)
            : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black87,
        ),
      ),
      body: Consumer<QuoteProvider>(
        builder: (context, quoteProvider, child) {
          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              final quote = quotes[index];
              // Check if this quote is in favorites
              quote.isFavorite = quoteProvider.favorites
                  .any((f) => f.text == quote.text && f.author == quote.author);
              
              return Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quote.text,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  height: 1.4,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            '- ${quote.author}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.color
                                      ?.withOpacity(0.8),
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 80,
                    child: Center(
                      child: AnimatedScale(
                        scale: quote.isFavorite ? 1.2 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: GestureDetector(
                          onTap: () => _handleFavorite(quoteProvider, quote, index),
                          child: Icon(
                            quote.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                            color: quote.isFavorite
                                ? Colors.redAccent
                                : Colors.grey.shade400,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
