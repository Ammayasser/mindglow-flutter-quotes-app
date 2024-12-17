import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../providers/quote_provider.dart';
import 'package:provider/provider.dart';
import 'favorite_button.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final int index;

  const QuoteCard({
    Key? key,
    required this.quote,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: FavoriteButton(quote: quote, index: index),
        ),
      ],
    );
  }
}
