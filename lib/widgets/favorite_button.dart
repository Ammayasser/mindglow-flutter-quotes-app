import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../providers/quote_provider.dart';
import 'package:provider/provider.dart';
import 'custom_snackbar.dart';

class FavoriteButton extends StatelessWidget {
  final Quote quote;
  final int index;

  const FavoriteButton({
    Key? key,
    required this.quote,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: quote.isFavorite ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: () {
            final quoteProvider = context.read<QuoteProvider>();
            quoteProvider.toggleFavorite(index);
            showCustomSnackBar(context, quote.isFavorite, () {
              quoteProvider.toggleFavorite(index);
            });
          },
          child: Icon(
            quote.isFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
            color:
                quote.isFavorite ? Colors.redAccent : Colors.grey.shade400,
            size: 35,
          ),
        ),
      ),
    );
  }
}
