import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../widgets/quote_card.dart';
import '../widgets/error_view.dart';
import '../widgets/loading_view.dart';
import '../widgets/topic_cards.dart';
import 'topic_detail_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<QuoteProvider>();
      for (int i = 0; i < 3; i++) {
        provider.fetchNewQuote();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.black87,
            ],
          ),
        ),
        child: Stack(
          children: [
            Consumer<QuoteProvider>(
              builder: (context, quoteProvider, child) {
                if (quoteProvider.error != null) {
                  return ErrorView(error: quoteProvider.error!);
                }

                if (quoteProvider.quotes.isEmpty) {
                  return const LoadingView();
                }

                return PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (index) {
                    if (index >= quoteProvider.quotes.length - 2) {
                      quoteProvider.fetchNewQuote();
                    }
                  },
                  itemBuilder: (context, index) {
                    if (index >= quoteProvider.quotes.length) {
                      return const LoadingView(withPadding: true);
                    }

                    return QuoteCard(
                      quote: quoteProvider.quotes[index],
                      index: index,
                    );
                  },
                );
              },
            ),
            // Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left icon
                    IconButton(
                      icon: const Icon(Icons.grid_view_rounded),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          transitionAnimationController: AnimationController(
                            duration: const Duration(milliseconds: 400),
                            vsync: Navigator.of(context),
                          ),
                          builder: (context) => FadeTransition(
                            opacity: Tween<double>(
                              begin: 0,
                              end: 1,
                            ).animate(CurvedAnimation(
                              parent: ModalRoute.of(context)!.animation!,
                              curve: Curves.easeOut,
                            )),
                            child: DraggableScrollableSheet(
                              initialChildSize: 0.9,
                              minChildSize: 0.5,
                              maxChildSize: 0.9,
                              builder: (context, scrollController) => Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? [
                                            Color(0xFF2C3E50),
                                            Color(0xFF1A1A2E),
                                          ]
                                        : [
                                            Color(0xFFF8F9FA),
                                            Color(0xFFE9ECEF),
                                          ],
                                  ),
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black.withOpacity(0.5)
                                          : Colors.grey.withOpacity(0.3),
                                      blurRadius: 15,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Close button and title
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 20, 10),
                                      child: Row(
                                        children: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text(
                                              'Close',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? Colors.grey.shade400
                                                    : Colors.grey.shade600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Explore topics text
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        'Explore topics',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    // Search bar
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Search topics...',
                                          prefixIcon: Icon(
                                            Icons.search_rounded,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.grey.shade400
                                                    : Colors.grey.shade600,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide.none,
                                          ),
                                          filled: true,
                                          fillColor:
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? Colors.grey.shade800
                                                  : Colors.grey.shade200,
                                          hintStyle: TextStyle(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? Colors.grey.shade400
                                                    : Colors.grey.shade600,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    // Unlock all topics card
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFF6448FE),
                                              Color(0xFF5FC6FF),
                                            ],
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFF6448FE)
                                                  .withOpacity(0.3),
                                              blurRadius: 15,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Unlock all topics',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Browse Topics you\'re interested in and follow them to customize your feed',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    // Topic cards grid
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              child: GridView.count(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                crossAxisCount: 2,
                                                childAspectRatio: 2.2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10,
                                                children: [
                                                  _buildTopicCard(
                                                    title: 'General',
                                                    icon: Icons
                                                        .format_quote_rounded,
                                                    color:
                                                        Colors.orange.shade400,
                                                    isSelected: true,
                                                  ),
                                                  _buildTopicCard(
                                                    title: 'My own quotes',
                                                    icon:
                                                        Icons.edit_note_rounded,
                                                    color:
                                                        Colors.green.shade400,
                                                    isSelected: false,
                                                  ),
                                                  _buildTopicCard(
                                                    title: 'My favorites',
                                                    icon:
                                                        Icons.favorite_rounded,
                                                    color: Colors.red.shade400,
                                                    isSelected: false,
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const FavoritesScreen(),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  _buildTopicCard(
                                                    title: 'Based on your mood',
                                                    icon: Icons.mood_rounded,
                                                    color:
                                                        Colors.purple.shade400,
                                                    isSelected: false,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 45),
                                            // Most Popular Section
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Most popular',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  SizedBox(
                                                    height: 200,
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              _buildPopularTopicCard(
                                                                  'Finding purpose',
                                                                  Icons
                                                                      .lightbulb_outline,
                                                                  Colors.blue
                                                                      .shade400),
                                                              const SizedBox(
                                                                  height: 10),
                                                              _buildPopularTopicCard(
                                                                  'Love',
                                                                  Icons
                                                                      .favorite_outline,
                                                                  Colors.red
                                                                      .shade400),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Column(
                                                            children: [
                                                              _buildPopularTopicCard(
                                                                  'Visionary thinkers',
                                                                  Icons
                                                                      .visibility_outlined,
                                                                  Colors.amber
                                                                      .shade400),
                                                              const SizedBox(
                                                                  height: 10),
                                                              _buildPopularTopicCard(
                                                                  'Most shared',
                                                                  Icons
                                                                      .share_outlined,
                                                                  Colors.green
                                                                      .shade400),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Column(
                                                            children: [
                                                              _buildPopularTopicCard(
                                                                  'Fake people',
                                                                  Icons
                                                                      .person_off_outlined,
                                                                  Colors.grey
                                                                      .shade600),
                                                              const SizedBox(
                                                                  height: 10),
                                                              _buildPopularTopicCard(
                                                                  'Mental toughness',
                                                                  Icons
                                                                      .psychology_outlined,
                                                                  Colors.purple
                                                                      .shade400),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Column(
                                                            children: [
                                                              _buildPopularTopicCard(
                                                                  'Inner peace',
                                                                  Icons
                                                                      .spa_outlined,
                                                                  Colors.teal
                                                                      .shade400),
                                                              const SizedBox(
                                                                  height: 10),
                                                              _buildPopularTopicCard(
                                                                  'Affirmations',
                                                                  Icons
                                                                      .stars_outlined,
                                                                  Colors.orange
                                                                      .shade400),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Column(
                                                            children: [
                                                              _buildPopularTopicCard(
                                                                  'Life lessons',
                                                                  Icons
                                                                      .school_outlined,
                                                                  Colors.indigo
                                                                      .shade400),
                                                              const SizedBox(
                                                                  height: 10),
                                                              _buildPopularTopicCard(
                                                                  'Short quotes',
                                                                  Icons
                                                                      .format_quote_outlined,
                                                                  Colors
                                                                      .deepPurple
                                                                      .shade400),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                              width: 10),
                                                          Column(
                                                            children: [
                                                              _buildPopularTopicCard(
                                                                  'Motivation',
                                                                  Icons
                                                                      .local_fire_department_outlined,
                                                                  Colors
                                                                      .deepOrange
                                                                      .shade400),
                                                              const SizedBox(
                                                                  height: 10),
                                                              _buildPopularTopicCard(
                                                                  'Positive thinking',
                                                                  Icons
                                                                      .sentiment_very_satisfied_outlined,
                                                                  Colors.cyan
                                                                      .shade400),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                            // For You Section
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Text(
                                                'For You',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            SizedBox(
                                              height: 200,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Life lessons',
                                                              Icons.school,
                                                              Colors.green
                                                                  .shade400),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Deep',
                                                              Icons.psychology,
                                                              Colors.blue),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Friendship',
                                                              Icons.people,
                                                              Colors.green),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Success',
                                                              Icons
                                                                  .emoji_events,
                                                              Colors.amber),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Family',
                                                              Icons
                                                                  .family_restroom,
                                                              Colors.orange),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Body Positivity',
                                                              Icons.favorite,
                                                              Colors.pink),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Self-development',
                                                              Icons.trending_up,
                                                              Colors.purple),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Sleep',
                                                              Icons.bedtime,
                                                              Colors.indigo),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Encouraging Words',
                                                              Icons
                                                                  .emoji_emotions,
                                                              Colors.amber),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Short Quotes',
                                                              Icons
                                                                  .format_quote,
                                                              Colors.teal),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                            // Hard Times Section
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Text(
                                                'Hard Times',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            SizedBox(
                                              height: 200,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Depression',
                                                              Icons
                                                                  .cloud_rounded,
                                                              Colors.grey
                                                                  .shade700),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Loneliness',
                                                              Icons
                                                                  .person_outline,
                                                              Colors.blue
                                                                  .shade700),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Dealing with Change',
                                                              Icons
                                                                  .change_circle_outlined,
                                                              Colors.green
                                                                  .shade700),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Unrequited Love',
                                                              Icons
                                                                  .heart_broken_outlined,
                                                              Colors.red
                                                                  .shade700),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Uncertainty',
                                                              Icons
                                                                  .help_outline_rounded,
                                                              Colors.orange
                                                                  .shade700),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Sadness',
                                                              Icons
                                                                  .sentiment_dissatisfied,
                                                              Colors.indigo
                                                                  .shade700),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Missing Someone',
                                                              Icons
                                                                  .person_off_outlined,
                                                              Colors.purple
                                                                  .shade700),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Dealing with Frustration',
                                                              Icons
                                                                  .psychology_outlined,
                                                              Colors.deepOrange
                                                                  .shade700),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        children: [
                                                          _buildPopularTopicCard(
                                                              'Heartbroken',
                                                              Icons
                                                                  .favorite_border_rounded,
                                                              Colors.pink
                                                                  .shade700),
                                                          const SizedBox(
                                                              height: 10),
                                                          _buildPopularTopicCard(
                                                              'Overcoming Fears',
                                                              Icons
                                                                  .security_rounded,
                                                              Colors.teal
                                                                  .shade700),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      color: Colors.grey.shade700,
                      iconSize: 26,
                    ),
                    // Right icons
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.ios_share_rounded),
                          onPressed: () {},
                          color: Colors.grey.shade700,
                          iconSize: 24,
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.person_2_rounded),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.85,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromARGB(255, 27, 25, 25)
                                      : Colors.grey.shade50,
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: CustomScrollView(
                                  slivers: [
                                    SliverToBoxAdapter(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Settings header
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 20, 20, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'SETTINGS',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text(
                                                    'Close',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? Colors.grey.shade400
                                                          : Colors
                                                              .grey.shade600,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // Settings Card
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Card(
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                children: [
                                                  _buildSettingRow(
                                                    context,
                                                    'Preferences',
                                                    Icons.settings_outlined,
                                                    onTap: () {},
                                                  ),
                                                  _buildDivider(context),
                                                  _buildSettingRow(
                                                    context,
                                                    'Topics you follow',
                                                    Icons.topic_outlined,
                                                    onTap: () {},
                                                  ),
                                                  _buildDivider(context),
                                                  _buildSettingRow(
                                                    context,
                                                    'App icon',
                                                    Icons
                                                        .app_settings_alt_outlined,
                                                    onTap: () {},
                                                  ),
                                                  _buildDivider(context),
                                                  _buildSettingRow(
                                                    context,
                                                    'Reminders',
                                                    Icons
                                                        .notifications_outlined,
                                                    onTap: () {},
                                                  ),
                                                  _buildDivider(context),
                                                  _buildSettingRow(
                                                    context,
                                                    'Home Screen widgets',
                                                    Icons.widgets_outlined,
                                                    onTap: () {},
                                                  ),
                                                  _buildDivider(context),
                                                  _buildSettingRow(
                                                    context,
                                                    'Lock Screen widgets',
                                                    Icons.lock_outline_rounded,
                                                    onTap: () {},
                                                  ),
                                                  _buildDivider(context),
                                                  _buildSettingRow(
                                                    context,
                                                    'Watch',
                                                    Icons.watch_outlined,
                                                    onTap: () {},
                                                  ),
                                                  _buildDivider(context),
                                                  _buildSettingRow(
                                                    context,
                                                    'Self-Growth bundle',
                                                    Icons.trending_up_outlined,
                                                    onTap: () {},
                                                    isLast: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 30),
                                          // Your Quotes Section
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'YOUR QUOTES',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Card(
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      _buildSettingRow(
                                                        context,
                                                        'Collections',
                                                        Icons.folder_outlined,
                                                        onTap: () {},
                                                      ),
                                                      _buildDivider(context),
                                                      _buildSettingRow(
                                                        context,
                                                        'Your own quotes',
                                                        Icons
                                                            .edit_note_outlined,
                                                        onTap: () {},
                                                      ),
                                                      _buildDivider(context),
                                                      _buildSettingRow(
                                                        context,
                                                        'History',
                                                        Icons.history_outlined,
                                                        onTap: () {},
                                                      ),
                                                      _buildDivider(context),
                                                      Consumer<QuoteProvider>(
                                                        builder: (context,
                                                                quoteProvider,
                                                                child) =>
                                                            _buildSettingRow(
                                                          context,
                                                          'Favorites (${quoteProvider.quotes.length})',
                                                          Icons
                                                              .favorite_outline,
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const FavoritesScreen(),
                                                              ),
                                                            );
                                                          },
                                                          isLast: true,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          color: Colors.grey.shade700,
                          iconSize: 26,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicCard({
    required String title,
    required IconData icon,
    required Color color,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final isThisSelected = provider.isTopicSelected(title);

        return GestureDetector(
          onTap: onTap ??
              () {
                provider.selectTopic(title);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailScreen(
                      topic: title,
                      icon: icon,
                      color: color,
                    ),
                  ),
                );
              },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 180,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  isDarkMode
                      ? (isThisSelected
                          ? color.withOpacity(0.3)
                          : Colors.grey.shade800)
                      : (isThisSelected
                          ? color.withOpacity(0.1)
                          : Colors.white),
                  isDarkMode
                      ? (isThisSelected
                          ? color.withOpacity(0.1)
                          : Colors.grey.shade900)
                      : (isThisSelected
                          ? color.withOpacity(0.05)
                          : Colors.grey.shade50),
                ],
              ),
              border: Border.all(
                color: isThisSelected
                    ? color
                    : (isDarkMode
                        ? Colors.grey.shade700
                        : Colors.grey.shade200),
                width: isThisSelected ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: isThisSelected
                      ? color.withOpacity(0.3)
                      : (isDarkMode
                          ? Colors.black.withOpacity(0.3)
                          : Colors.grey.shade200),
                  blurRadius: isThisSelected ? 12 : 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: isThisSelected ? color : color.withOpacity(0.7),
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isThisSelected
                              ? FontWeight.bold
                              : FontWeight.w600,
                          color: isDarkMode
                              ? Colors.grey.shade300
                              : Colors.grey.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
                if (isThisSelected)
                  Positioned(
                    bottom: 5,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            color.withOpacity(0.2),
                            color.withOpacity(0.1),
                          ],
                        ),
                        border: Border.all(
                          color: color.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: color,
                        size: 20,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPopularTopicCard(String topic, IconData icon, Color color) {
    return PopularTopicCard(
      topic: topic,
      icon: icon,
      color: color,
    );
  }

  Widget _buildSettingRow(BuildContext context, String title, IconData icon,
      {required VoidCallback onTap, bool isLast = false}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade400
                  : Colors.grey.shade700,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.shade200
                      : Colors.grey.shade800,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 24,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade600
                  : Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey.shade800
          : Colors.grey.shade200,
    );
  }
}
