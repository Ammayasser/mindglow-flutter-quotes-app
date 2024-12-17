import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final bool withPadding;
  
  const LoadingView({
    Key? key,
    this.withPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget loader = const CircularProgressIndicator();
    
    if (withPadding) {
      loader = Padding(
        padding: const EdgeInsets.all(16.0),
        child: loader,
      );
    }
    
    return Center(child: loader);
  }
}
