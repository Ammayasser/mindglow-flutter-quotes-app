import 'package:flutter/material.dart';
import '../providers/quote_provider.dart';
import 'package:provider/provider.dart';

class ErrorView extends StatelessWidget {
  final String error;

  const ErrorView({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Error: $error',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final provider = context.read<QuoteProvider>();
              provider.clearError();
              provider.fetchNewQuote();
            },
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }
}
