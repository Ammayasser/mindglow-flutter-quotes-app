import '../models/quote.dart';

class FamilyQuote extends Quote {
  FamilyQuote({
    required String text,
    required String author,
    bool isFavorite = false,
  }) : super(text: text, author: author, isFavorite: isFavorite);
}

final List<FamilyQuote> familyQuotes = [
  // The Importance of Family
  FamilyQuote(
    text: "Family is not an important thing; it's everything.",
    author: "Michael J. Fox",
  ),
  FamilyQuote(
    text: "A happy family is but an earlier heaven.",
    author: "George Bernard Shaw",
  ),
  FamilyQuote(
    text: "Family is the compass that guides us. They are the inspiration to reach great heights and our comfort when we falter.",
    author: "Brad Henry",
  ),
  FamilyQuote(
    text: "In every conceivable manner, the family is a link to our past and a bridge to our future.",
    author: "Alex Haley",
  ),
  FamilyQuote(
    text: "The love of a family is life's greatest blessing.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Family means no one gets left behind or forgotten.",
    author: "David Ogden Stiers",
  ),
  FamilyQuote(
    text: "Call it a clan, call it a network, call it a tribe, call it a family. Whatever you call it, whoever you are, you need one.",
    author: "Jane Howard",
  ),
  FamilyQuote(
    text: "The family is one of nature's masterpieces.",
    author: "George Santayana",
  ),
  FamilyQuote(
    text: "A family doesn't have to be perfect; it just needs to be united.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Where there is family, there is love.",
    author: "Unknown",
  ),

  // Family as Strength
  FamilyQuote(
    text: "The strength of a family, like the strength of an army, is in its loyalty to each other.",
    author: "Mario Puzo",
  ),
  FamilyQuote(
    text: "Family is the anchor that holds us through life's storms.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Home is where you are loved the most and act the worst.",
    author: "Marjorie Pay Hinckley",
  ),
  FamilyQuote(
    text: "What can you do to promote world peace? Go home and love your family.",
    author: "Mother Teresa",
  ),
  FamilyQuote(
    text: "In times of test, the family is the best.",
    author: "Burmese Proverb",
  ),
  FamilyQuote(
    text: "When trouble comes, your family will always have your back.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Families are like branches on a tree. We grow in different directions, yet our roots remain as one.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "The family is the first essential cell of human society.",
    author: "Pope John XXIII",
  ),
  FamilyQuote(
    text: "To us, family means putting your arms around each other and being there.",
    author: "Barbara Bush",
  ),
  FamilyQuote(
    text: "It's not what we have in life, but who we have in our life that matters.",
    author: "Unknown",
  ),

  // Family Love and Support
  FamilyQuote(
    text: "A family's love is the greatest wealth.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Family gives you roots to stand tall and strong.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "The love of a family is a life's greatest treasure.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Love your family as you love yourself.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Being a family means you are part of something very wonderful. It means you will love and be loved for the rest of your life.",
    author: "Lisa Weed",
  ),
  FamilyQuote(
    text: "Families are the compass that guides us back home.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Family love is the fuel that inspires greatness.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "In the end, it's the family that matters most.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "A family stitched together with love seldom unravels.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "The bond that links your true family is not one of blood, but of respect and joy in each other's life.",
    author: "Richard Bach",
  ),

  // Cherishing Family Moments
  FamilyQuote(
    text: "Some of the most important moments in life happen with family by your side.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Life is beautiful when you share it with those you love the most.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Cherish your family moments; they become your precious memories.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Family is where life begins and love never ends.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Home is not a place, it's a feeling. And family is home.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "The time you spend with family is the most valuable time of all.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Family is the heart of life and the soul of memories.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "The best times are always found with family.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "The magic of family is in the little moments together.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Life is short, but the memories with family are forever.",
    author: "Unknown",
  ),

  // Motivating Family Bonds
  FamilyQuote(
    text: "Happiness is having a large, loving, caring, close-knit family… in another city.",
    author: "George Burns",
  ),
  FamilyQuote(
    text: "Blood makes you related, but loyalty makes you family.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Family isn't always blood. It's the people in your life who want you in theirs.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "The family bond is the foundation of every success.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Stronger together: That's the essence of family.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Your family is your refuge in a chaotic world.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "United we stand, as a family we conquer.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "When the roots are deep, there's no reason to fear the wind.",
    author: "African Proverb",
  ),
  FamilyQuote(
    text: "Strength grows in the moments when your family stands together.",
    author: "Unknown",
  ),
  FamilyQuote(
    text: "Every family is unique, and every family is beautiful.",
    author: "Unknown",
  ),
];
