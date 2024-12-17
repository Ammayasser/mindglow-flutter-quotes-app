import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../screens/topic_detail_screen.dart';
import '../screens/love_quotes_screen.dart';
import '../screens/purpose_quotes_screen.dart';
import '../screens/visionary_quotes_screen.dart';
import '../screens/fake_people_quotes_screen.dart';
import '../screens/mental_toughness_quotes_screen.dart';
import '../screens/inner_peace_quotes_screen.dart';
import '../screens/affirmation_quotes_screen.dart';
import '../screens/life_lesson_quotes_screen.dart';
import '../screens/short_quotes_screen.dart';
import '../screens/deep_quotes_screen.dart';
import '../screens/friendship_quotes_screen.dart';
import '../screens/success_quotes_screen.dart';
import '../screens/family_quotes_screen.dart';

class TopicCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback? onTap;

  const TopicCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final isThisSelected = provider.isTopicSelected(title);

        return GestureDetector(
          onTap: onTap ??
              () {
                provider.selectTopic(title);
                if (title == "Love") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoveQuotesScreen(),
                    ),
                  );
                } else if (title == "Finding purpose") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PurposeQuotesScreen(),
                    ),
                  );
                } else if (title == "Visionary thinkers") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VisionaryQuotesScreen(),
                    ),
                  );
                } else if (title == "Fake people") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FakePeopleQuotesScreen(),
                    ),
                  );
                } else if (title == "Mental toughness") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MentalToughnessQuotesScreen(),
                    ),
                  );
                } else if (title == "Inner peace") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InnerPeaceQuotesScreen(),
                    ),
                  );
                } else if (title == "Affirmations") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AffirmationQuotesScreen(),
                    ),
                  );
                } else if (title == "Life Lessons") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LifeLessonQuotesScreen(),
                    ),
                  );
                } else if (title == "Short quotes") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShortQuotesScreen(),
                    ),
                  );
                } else if (title == "Deep") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DeepQuotesScreen(),
                    ),
                  );
                } else if (title == "Friendship") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FriendshipQuotesScreen(),
                    ),
                  );
                } else if (title == "Success") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessQuotesScreen(),
                    ),
                  );
                } else if (title == "Family") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FamilyQuotesScreen(),
                    ),
                  );
                } else {
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
                }
              },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 180,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDarkMode ? Colors.grey.shade900 : Colors.white,
              border: Border.all(
                color: isThisSelected
                    ? color
                    : (isDarkMode ? Colors.grey.shade800 : Colors.transparent),
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
                        color: isDarkMode ? Colors.grey.shade900 : Colors.white,
                        shape: BoxShape.circle,
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
}

class PopularTopicCard extends StatelessWidget {
  final String topic;
  final IconData icon;
  final Color color;

  const PopularTopicCard({
    Key? key,
    required this.topic,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        final isSelected = provider.isTopicSelected(topic);

        return GestureDetector(
          onTap: () {
            provider.selectTopic(topic);
            if (topic == "Love") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoveQuotesScreen(),
                ),
              );
            } else if (topic == "Finding purpose") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PurposeQuotesScreen(),
                ),
              );
            } else if (topic == "Life lessons") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LifeLessonQuotesScreen(),
                ),
              );
            } else if (topic == "Visionary thinkers") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VisionaryQuotesScreen(),
                ),
              );
            } else if (topic == "Fake people") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FakePeopleQuotesScreen(),
                ),
              );
            } else if (topic == "Mental toughness") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MentalToughnessQuotesScreen(),
                ),
              );
            } else if (topic == "Inner peace") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InnerPeaceQuotesScreen(),
                ),
              );
            } else if (topic == "Affirmations") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AffirmationQuotesScreen(),
                ),
              );
            } else if (topic == "Short quotes") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShortQuotesScreen(),
                ),
              );
            } else if (topic == "Deep") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeepQuotesScreen(),
                ),
              );
            } else if (topic == "Friendship") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FriendshipQuotesScreen(),
                ),
              );
            } else if (topic == "Success") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuccessQuotesScreen(),
                ),
              );
            } else if (topic == "Family") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FamilyQuotesScreen(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TopicDetailScreen(
                    topic: topic,
                    icon: icon,
                    color: color,
                  ),
                ),
              );
            }
          },
          child: Container(
            width: 180,
            height: 90,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isDarkMode ? Colors.grey.shade900 : Colors.white,
              border: isDarkMode
                  ? Border.all(color: Colors.grey.shade800, width: 1)
                  : null,
              boxShadow: isDarkMode
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  right: 35,
                  child: Text(
                    topic,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode
                          ? Colors.grey.shade300
                          : Colors.grey.shade800,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
                ),
                if (isSelected)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey.shade900 : Colors.white,
                        shape: BoxShape.circle,
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
}
