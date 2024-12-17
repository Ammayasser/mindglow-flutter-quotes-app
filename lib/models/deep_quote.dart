import '../models/quote.dart';

class DeepQuote extends Quote {
  DeepQuote({
    required String text,
    required String author,
    bool isFavorite = false,
  }) : super(text: text, author: author, isFavorite: isFavorite);
}

final List<DeepQuote> deepQuotes = [
  // Life and Growth
  DeepQuote(
    text: "The only way out is through.",
    author: "Robert Frost",
  ),
  DeepQuote(
    text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
    author: "Ralph Waldo Emerson",
  ),
  DeepQuote(
    text: "Every adversity, every failure, every heartache carries with it the seed of an equal or greater benefit.",
    author: "Napoleon Hill",
  ),
  DeepQuote(
    text: "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    author: "Winston Churchill",
  ),
  DeepQuote(
    text: "Growth begins at the end of your comfort zone.",
    author: "Roy T. Bennett",
  ),

  // Perseverance and Resilience
  DeepQuote(
    text: "It does not matter how slowly you go as long as you do not stop.",
    author: "Confucius",
  ),
  DeepQuote(
    text: "Strength does not come from physical capacity. It comes from an indomitable will.",
    author: "Mahatma Gandhi",
  ),
  DeepQuote(
    text: "Fall seven times and stand up eight.",
    author: "Japanese Proverb",
  ),
  DeepQuote(
    text: "Hardships often prepare ordinary people for an extraordinary destiny.",
    author: "C.S. Lewis",
  ),
  DeepQuote(
    text: "The struggle you're in today is developing the strength you need for tomorrow.",
    author: "Robert Tew",
  ),
  DeepQuote(
    text: "Do not judge me by my success, judge me by how many times I fell down and got back up again.",
    author: "Nelson Mandela",
  ),
  DeepQuote(
    text: "If you're going through hell, keep going.",
    author: "Winston Churchill",
  ),
  DeepQuote(
    text: "Resilience is knowing that you are the only one who has the power and the responsibility to pick yourself up.",
    author: "Mary Holloway",
  ),
  DeepQuote(
    text: "Pain is temporary. Quitting lasts forever.",
    author: "Lance Armstrong",
  ),
  DeepQuote(
    text: "Rock bottom became the solid foundation on which I rebuilt my life.",
    author: "J.K. Rowling",
  ),

  // Courage and Confidence
  DeepQuote(
    text: "Do one thing every day that scares you.",
    author: "Eleanor Roosevelt",
  ),
  DeepQuote(
    text: "Courage is resistance to fear, mastery of fear—not absence of fear.",
    author: "Mark Twain",
  ),
  DeepQuote(
    text: "Everything you've ever wanted is on the other side of fear.",
    author: "George Addair",
  ),
  DeepQuote(
    text: "The only limit to our realization of tomorrow will be our doubts of today.",
    author: "Franklin D. Roosevelt",
  ),
  DeepQuote(
    text: "Be brave. Take risks. Nothing can substitute experience.",
    author: "Paulo Coelho",
  ),
  DeepQuote(
    text: "Believe you can and you're halfway there.",
    author: "Theodore Roosevelt",
  ),
  DeepQuote(
    text: "It takes courage to grow up and become who you really are.",
    author: "E.E. Cummings",
  ),
  DeepQuote(
    text: "Go confidently in the direction of your dreams. Live the life you have imagined.",
    author: "Henry David Thoreau",
  ),
  DeepQuote(
    text: "Your only limit is you.",
    author: "Anonymous",
  ),
  DeepQuote(
    text: "Act as if what you do makes a difference. It does.",
    author: "William James",
  ),

  // Purpose and Ambition
  DeepQuote(
    text: "Don't count the days, make the days count.",
    author: "Muhammad Ali",
  ),
  DeepQuote(
    text: "He who has a why to live can bear almost any how.",
    author: "Friedrich Nietzsche",
  ),
  DeepQuote(
    text: "Success usually comes to those who are too busy to be looking for it.",
    author: "Henry David Thoreau",
  ),
  DeepQuote(
    text: "You are not here merely to make a living. You are here to enable the world to live more amply.",
    author: "Woodrow Wilson",
  ),
  DeepQuote(
    text: "Do what you can, with what you have, where you are.",
    author: "Theodore Roosevelt",
  ),
  DeepQuote(
    text: "Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.",
    author: "Roy T. Bennett",
  ),
  DeepQuote(
    text: "Your time is limited, so don't waste it living someone else's life.",
    author: "Steve Jobs",
  ),
  DeepQuote(
    text: "If you want to fly, give up everything that weighs you down.",
    author: "Buddha",
  ),
  DeepQuote(
    text: "Passion is the fuel; purpose is the destination.",
    author: "Anonymous",
  ),
  DeepQuote(
    text: "A goal without a plan is just a wish.",
    author: "Antoine de Saint-Exupéry",
  ),

  // Wisdom and Reflection
  DeepQuote(
    text: "Knowing yourself is the beginning of all wisdom.",
    author: "Aristotle",
  ),
  DeepQuote(
    text: "Turn your wounds into wisdom.",
    author: "Oprah Winfrey",
  ),
  DeepQuote(
    text: "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
    author: "Buddha",
  ),
  DeepQuote(
    text: "Happiness is not something ready-made. It comes from your own actions.",
    author: "Dalai Lama",
  ),
  DeepQuote(
    text: "The mind is everything. What you think, you become.",
    author: "Buddha",
  ),
  DeepQuote(
    text: "Life is really simple, but we insist on making it complicated.",
    author: "Confucius",
  ),
  DeepQuote(
    text: "When you change the way you look at things, the things you look at change.",
    author: "Wayne Dyer",
  ),
  DeepQuote(
    text: "An unexamined life is not worth living.",
    author: "Socrates",
  ),
  DeepQuote(
    text: "The more you know yourself, the quieter you become.",
    author: "Anonymous",
  ),
  DeepQuote(
    text: "Wisdom is not a product of schooling but of the lifelong attempt to acquire it.",
    author: "Albert Einstein",
  ),

  // Success and Achievement
  DeepQuote(
    text: "Success is walking from failure to failure with no loss of enthusiasm.",
    author: "Winston Churchill",
  ),
  DeepQuote(
    text: "Don't be afraid to give up the good to go for the great.",
    author: "John D. Rockefeller",
  ),
  DeepQuote(
    text: "Opportunities don't happen. You create them.",
    author: "Chris Grosser",
  ),
  DeepQuote(
    text: "I find that the harder I work, the more luck I seem to have.",
    author: "Thomas Jefferson",
  ),
  DeepQuote(
    text: "Success is how high you bounce when you hit bottom.",
    author: "George S. Patton",
  ),
  DeepQuote(
    text: "Dream big and dare to fail.",
    author: "Norman Vaughan",
  ),
  DeepQuote(
    text: "What seems to us as bitter trials are often blessings in disguise.",
    author: "Oscar Wilde",
  ),
  DeepQuote(
    text: "The best way to predict the future is to create it.",
    author: "Abraham Lincoln",
  ),
  DeepQuote(
    text: "Action is the foundational key to all success.",
    author: "Pablo Picasso",
  ),
  DeepQuote(
    text: "Start where you are. Use what you have. Do what you can.",
    author: "Arthur Ashe",
  ),

  // Inspiration and Positivity
  DeepQuote(
    text: "Keep your face always toward the sunshine—and shadows will fall behind you.",
    author: "Walt Whitman",
  ),
  DeepQuote(
    text: "No matter how dark it gets, the sun always rises again.",
    author: "Unknown",
  ),
  DeepQuote(
    text: "Be the change that you wish to see in the world.",
    author: "Mahatma Gandhi",
  ),
  DeepQuote(
    text: "The best way to cheer yourself is to try to cheer someone else up.",
    author: "Mark Twain",
  ),
  DeepQuote(
    text: "Happiness is not by chance, but by choice.",
    author: "Jim Rohn",
  ),
  DeepQuote(
    text: "You don't have to be perfect to be amazing.",
    author: "Unknown",
  ),
  DeepQuote(
    text: "Do something today that your future self will thank you for.",
    author: "Sean Patrick Flanery",
  ),
  DeepQuote(
    text: "A positive mindset brings positive things.",
    author: "Unknown",
  ),
  DeepQuote(
    text: "It's not about how much you do, but how much love you put into what you do.",
    author: "Mother Teresa",
  ),
  DeepQuote(
    text: "Happiness depends upon ourselves.",
    author: "Aristotle",
  ),

  // Focus and Discipline
  DeepQuote(
    text: "Discipline is the bridge between goals and accomplishment.",
    author: "Jim Rohn",
  ),
  DeepQuote(
    text: "You will never always be motivated, so you must learn to be disciplined.",
    author: "Unknown",
  ),
  DeepQuote(
    text: "Focus on being productive instead of busy.",
    author: "Tim Ferriss",
  ),
  DeepQuote(
    text: "It's not the will to win that matters—everyone has that. It's the will to prepare to win that matters.",
    author: "Paul Bryant",
  ),
  DeepQuote(
    text: "Small disciplines repeated with consistency every day lead to great achievements over time.",
    author: "John C. Maxwell",
  ),
  DeepQuote(
    text: "The successful warrior is the average man, with laser-like focus.",
    author: "Bruce Lee",
  ),
  DeepQuote(
    text: "The difference between successful people and very successful people is that very successful people say no to almost everything.",
    author: "Warren Buffett",
  ),
  DeepQuote(
    text: "Don't watch the clock; do what it does. Keep going.",
    author: "Sam Levenson",
  ),
  DeepQuote(
    text: "You miss 100% of the shots you don't take.",
    author: "Wayne Gretzky",
  ),
  DeepQuote(
    text: "The key to success is to focus on goals, not obstacles.",
    author: "Unknown",
  ),
];
