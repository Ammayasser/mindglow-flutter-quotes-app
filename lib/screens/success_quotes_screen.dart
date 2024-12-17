import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/quote.dart';
import '../models/success_quote.dart';
import '../providers/quote_provider.dart';
import '../widgets/custom_snackbar.dart';

class SuccessQuotesScreen extends StatefulWidget {
  const SuccessQuotesScreen({Key? key}) : super(key: key);

  @override
  State<SuccessQuotesScreen> createState() => _SuccessQuotesScreenState();
}

class _SuccessQuotesScreenState extends State<SuccessQuotesScreen> {
  final PageController _pageController = PageController();
  final List<Quote> quotes = List.from(successQuotes);

  @override
  void initState() {
    super.initState();
    print('Success Quotes Length: ${quotes.length}'); // Debug print
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<QuoteProvider>();
      // Update favorite status for all quotes
      for (var quote in quotes) {
        quote.isFavorite = provider.favorites
            .any((f) => f.text == quote.text && f.author == quote.author);
      }
      setState(() {});
    });
  }

  void _handleFavorite(QuoteProvider provider, Quote quote, int index) async {
    setState(() {
      quote.isFavorite = !quote.isFavorite;
    });
    
    await provider.toggleDeepQuoteFavorite(quote);
    
    showCustomSnackBar(
      context,
      quote.isFavorite,
      () async {
        setState(() {
          quote.isFavorite = !quote.isFavorite;
        });
        await provider.toggleDeepQuoteFavorite(quote);
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
          'Success Quotes',
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
