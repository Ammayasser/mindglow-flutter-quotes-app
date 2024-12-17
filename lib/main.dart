import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/quote_provider.dart';
import 'screens/home_screen.dart';
import 'screens/get_started_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuoteProvider(),
      child: MaterialApp(
        title: 'Motivation',
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.outfitTextTheme(ThemeData.light().textTheme),
          primaryTextTheme:
              GoogleFonts.outfitTextTheme(ThemeData.light().primaryTextTheme),
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme),
          primaryTextTheme:
              GoogleFonts.outfitTextTheme(ThemeData.dark().primaryTextTheme),
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const GetStartedScreen(),
          '/home': (context) => const HomeScreen(),
        },
        initialRoute: '/',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
      ),
    );
  }
}
