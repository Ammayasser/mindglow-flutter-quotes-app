import 'package:flutter/material.dart';

void showCustomSnackBar(
    BuildContext context, bool isFavorite, VoidCallback onUndo) {
  final message = isFavorite ? 'Added to favorites ❤️' : 'Removed from favorites';
  
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            isFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(message),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor:
          isFavorite ? Colors.pink.shade400 : Colors.grey.shade700,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'UNDO',
        textColor: Colors.white,
        onPressed: onUndo,
      ),
    ),
  );
}
