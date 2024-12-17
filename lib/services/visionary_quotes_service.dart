import '../models/visionary_quote.dart';

class VisionaryQuotesService {
  static List<VisionaryQuote> getAllQuotes() {
    return [
      // Vision and Ambition
      VisionaryQuote(
        quote: "The best way to predict the future is to create it.",
        author: "Peter Drucker",
        category: "Vision and Ambition",
      ),
      VisionaryQuote(
        quote: "Dream big. Start small. Act now.",
        author: "Robin Sharma",
        category: "Vision and Ambition",
      ),
      VisionaryQuote(
        quote: "Success is not final; failure is not fatal: It is the courage to continue that counts.",
        author: "Winston Churchill",
        category: "Vision and Ambition",
      ),
      VisionaryQuote(
        quote: "The future belongs to those who believe in the beauty of their dreams.",
        author: "Eleanor Roosevelt",
        category: "Vision and Ambition",
      ),
      VisionaryQuote(
        quote: "Vision without execution is hallucination.",
        author: "Thomas Edison",
        category: "Vision and Ambition",
      ),
      VisionaryQuote(
        quote: "If you can dream it, you can do it.",
        author: "Walt Disney",
        category: "Vision and Ambition",
      ),
      VisionaryQuote(
        quote: "Don't watch the clock; do what it does. Keep going.",
        author: "Sam Levenson",
        category: "Vision and Ambition",
      ),
      VisionaryQuote(
        quote: "A vision is not just a picture of what could be; it is an appeal to our better selves.",
        author: "Rosabeth Moss Kanter",
        category: "Vision and Ambition",
      ),

      // Overcoming Obstacles
      VisionaryQuote(
        quote: "It always seems impossible until it's done.",
        author: "Nelson Mandela",
        category: "Overcoming Obstacles",
      ),
      VisionaryQuote(
        quote: "Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.",
        author: "Roy T. Bennett",
        category: "Overcoming Obstacles",
      ),
      VisionaryQuote(
        quote: "The only limit to our realization of tomorrow will be our doubts of today.",
        author: "Franklin D. Roosevelt",
        category: "Overcoming Obstacles",
      ),
      VisionaryQuote(
        quote: "Success usually comes to those who are too busy to be looking for it.",
        author: "Henry David Thoreau",
        category: "Overcoming Obstacles",
      ),
      VisionaryQuote(
        quote: "Do not wait to strike till the iron is hot, but make it hot by striking.",
        author: "William Butler Yeats",
        category: "Overcoming Obstacles",
      ),

      // Creativity and Innovation
      VisionaryQuote(
        quote: "Innovation distinguishes between a leader and a follower.",
        author: "Steve Jobs",
        category: "Creativity and Innovation",
      ),
      VisionaryQuote(
        quote: "Imagination is more important than knowledge.",
        author: "Albert Einstein",
        category: "Creativity and Innovation",
      ),
      VisionaryQuote(
        quote: "Do not follow where the path may lead. Go instead where there is no path and leave a trail.",
        author: "Ralph Waldo Emerson",
        category: "Creativity and Innovation",
      ),
      VisionaryQuote(
        quote: "Great things are done by a series of small things brought together.",
        author: "Vincent Van Gogh",
        category: "Creativity and Innovation",
      ),
      VisionaryQuote(
        quote: "Think big and don't listen to people who tell you it can't be done. Life's too short to think small.",
        author: "Tim Ferriss",
        category: "Creativity and Innovation",
      ),

      // Leadership and Influence
      VisionaryQuote(
        quote: "Leadership is the capacity to translate vision into reality.",
        author: "Warren Bennis",
        category: "Leadership and Influence",
      ),
      VisionaryQuote(
        quote: "A leader is one who knows the way, goes the way, and shows the way.",
        author: "John Maxwell",
        category: "Leadership and Influence",
      ),
      VisionaryQuote(
        quote: "The task of the leader is to get their people from where they are to where they have not been.",
        author: "Henry Kissinger",
        category: "Leadership and Influence",
      ),
      VisionaryQuote(
        quote: "People buy into the leader before they buy into the vision.",
        author: "John Maxwell",
        category: "Leadership and Influence",
      ),
      VisionaryQuote(
        quote: "You don't need a title to be a leader.",
        author: "Mark Sanborn",
        category: "Leadership and Influence",
      ),

      // Persistence and Resilience
      VisionaryQuote(
        quote: "Our greatest glory is not in never falling, but in rising every time we fall.",
        author: "Confucius",
        category: "Persistence and Resilience",
      ),
      VisionaryQuote(
        quote: "I have not failed. I've just found 10,000 ways that won't work.",
        author: "Thomas Edison",
        category: "Persistence and Resilience",
      ),
      VisionaryQuote(
        quote: "Fall seven times, stand up eight.",
        author: "Japanese Proverb",
        category: "Persistence and Resilience",
      ),
      VisionaryQuote(
        quote: "The only way to do great work is to love what you do.",
        author: "Steve Jobs",
        category: "Persistence and Resilience",
      ),
      VisionaryQuote(
        quote: "You don't have to be great to start, but you have to start to be great.",
        author: "Zig Ziglar",
        category: "Persistence and Resilience",
      ),

      // Growth and Self-Development
      VisionaryQuote(
        quote: "The only limit to your impact is your imagination and commitment.",
        author: "Tony Robbins",
        category: "Growth and Self-Development",
      ),
      VisionaryQuote(
        quote: "Do not wait; the time will never be 'just right.' Start where you stand.",
        author: "Napoleon Hill",
        category: "Growth and Self-Development",
      ),
      VisionaryQuote(
        quote: "Success is not how high you have climbed, but how you make a positive difference to the world.",
        author: "Roy T. Bennett",
        category: "Growth and Self-Development",
      ),
      VisionaryQuote(
        quote: "In the middle of difficulty lies opportunity.",
        author: "Albert Einstein",
        category: "Growth and Self-Development",
      ),
      VisionaryQuote(
        quote: "If you are not willing to risk the usual, you will have to settle for the ordinary.",
        author: "Jim Rohn",
        category: "Growth and Self-Development",
      ),

      // Courage and Risk-Taking
      VisionaryQuote(
        quote: "Life is either a daring adventure or nothing at all.",
        author: "Helen Keller",
        category: "Courage and Risk-Taking",
      ),
      VisionaryQuote(
        quote: "Courage is resistance to fear, mastery of fear—not absence of fear.",
        author: "Mark Twain",
        category: "Courage and Risk-Taking",
      ),
      VisionaryQuote(
        quote: "You miss 100% of the shots you don't take.",
        author: "Wayne Gretzky",
        category: "Courage and Risk-Taking",
      ),
      VisionaryQuote(
        quote: "Everything you've ever wanted is on the other side of fear.",
        author: "George Addair",
        category: "Courage and Risk-Taking",
      ),
      VisionaryQuote(
        quote: "Go confidently in the direction of your dreams. Live the life you have imagined.",
        author: "Henry David Thoreau",
        category: "Courage and Risk-Taking",
      ),

      // Achievement and Success
      VisionaryQuote(
        quote: "Don't be afraid to give up the good to go for the great.",
        author: "John D. Rockefeller",
        category: "Achievement and Success",
      ),
      VisionaryQuote(
        quote: "Success is how high you bounce when you hit bottom.",
        author: "George S. Patton",
        category: "Achievement and Success",
      ),
      VisionaryQuote(
        quote: "Action is the foundational key to all success.",
        author: "Pablo Picasso",
        category: "Achievement and Success",
      ),
      VisionaryQuote(
        quote: "Success isn't overnight. It's when every day you get a little better than the day before. It all adds up.",
        author: "Dwayne Johnson",
        category: "Achievement and Success",
      ),
      VisionaryQuote(
        quote: "Opportunities don't happen. You create them.",
        author: "Chris Grosser",
        category: "Achievement and Success",
      ),

      // Legacy and Impact
      VisionaryQuote(
        quote: "Try not to become a man of success but rather a man of value.",
        author: "Albert Einstein",
        category: "Legacy and Impact",
      ),
      VisionaryQuote(
        quote: "Your time is limited, don't waste it living someone else's life.",
        author: "Steve Jobs",
        category: "Legacy and Impact",
      ),
      VisionaryQuote(
        quote: "What we do in life echoes in eternity.",
        author: "Marcus Aurelius",
        category: "Legacy and Impact",
      ),
      VisionaryQuote(
        quote: "Be the change that you wish to see in the world.",
        author: "Mahatma Gandhi",
        category: "Legacy and Impact",
      ),
      VisionaryQuote(
        quote: "We make a living by what we get. We make a life by what we give.",
        author: "Winston Churchill",
        category: "Legacy and Impact",
      ),
    ];
  }

  static List<String> getCategories() {
    return [
      "Vision and Ambition",
      "Overcoming Obstacles",
      "Creativity and Innovation",
      "Leadership and Influence",
      "Persistence and Resilience",
      "Growth and Self-Development",
      "Courage and Risk-Taking",
      "Achievement and Success",
      "Legacy and Impact",
    ];
  }
}
