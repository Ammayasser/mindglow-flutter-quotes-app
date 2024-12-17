import '../models/quote.dart';

class SuccessQuote extends Quote {
  SuccessQuote({
    required String text,
    required String author,
    bool isFavorite = false,
  }) : super(text: text, author: author, isFavorite: isFavorite);
}

final List<SuccessQuote> successQuotes = [
  // Dream Big
  SuccessQuote(
    text: "Success usually comes to those who are too busy to be looking for it.",
    author: "Henry David Thoreau",
  ),
  SuccessQuote(
    text: "Don't watch the clock; do what it does. Keep going.",
    author: "Sam Levenson",
  ),
  SuccessQuote(
    text: "Success is not final; failure is not fatal: It is the courage to continue that counts.",
    author: "Winston Churchill",
  ),
  SuccessQuote(
    text: "Start where you are. Use what you have. Do what you can.",
    author: "Arthur Ashe",
  ),
  SuccessQuote(
    text: "The only limit to our realization of tomorrow will be our doubts of today.",
    author: "Franklin D. Roosevelt",
  ),
  SuccessQuote(
    text: "Dream big and dare to fail.",
    author: "Norman Vaughan",
  ),
  SuccessQuote(
    text: "Don't be pushed around by the fears in your mind. Be led by the dreams in your heart.",
    author: "Roy T. Bennett",
  ),
  SuccessQuote(
    text: "All our dreams can come true, if we have the courage to pursue them.",
    author: "Walt Disney",
  ),
  SuccessQuote(
    text: "Big things often have small beginnings.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "If you can dream it, you can do it.",
    author: "Walt Disney",
  ),

  // Hard Work and Discipline
  SuccessQuote(
    text: "The road to success is not easy to navigate, but with hard work, drive, and passion, it's possible to achieve your dreams.",
    author: "Tommy Hilfiger",
  ),
  SuccessQuote(
    text: "Success doesn't come from what you do occasionally; it comes from what you do consistently.",
    author: "Marie Forleo",
  ),
  SuccessQuote(
    text: "Work hard in silence; let your success make the noise.",
    author: "Frank Ocean",
  ),
  SuccessQuote(
    text: "Do not be embarrassed by your failures; learn from them and start again.",
    author: "Richard Branson",
  ),
  SuccessQuote(
    text: "Don't wait for opportunity. Create it.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Discipline is the bridge between goals and accomplishment.",
    author: "Jim Rohn",
  ),
  SuccessQuote(
    text: "Strive not to be a success, but rather to be of value.",
    author: "Albert Einstein",
  ),
  SuccessQuote(
    text: "The way to get started is to quit talking and begin doing.",
    author: "Walt Disney",
  ),
  SuccessQuote(
    text: "There are no shortcuts to any place worth going.",
    author: "Beverly Sills",
  ),
  SuccessQuote(
    text: "Focus on your goals, not the obstacles.",
    author: "Unknown",
  ),

  // Mindset for Success
  SuccessQuote(
    text: "Whether you think you can or you think you can't, you're right.",
    author: "Henry Ford",
  ),
  SuccessQuote(
    text: "Believe you can, and you're halfway there.",
    author: "Theodore Roosevelt",
  ),
  SuccessQuote(
    text: "Success is walking from failure to failure with no loss of enthusiasm.",
    author: "Winston Churchill",
  ),
  SuccessQuote(
    text: "I attribute my success to this: I never gave or took any excuse.",
    author: "Florence Nightingale",
  ),
  SuccessQuote(
    text: "Success is not how high you have climbed, but how you make a positive difference to the world.",
    author: "Roy T. Bennett",
  ),
  SuccessQuote(
    text: "You are never too old to set another goal or to dream a new dream.",
    author: "C.S. Lewis",
  ),
  SuccessQuote(
    text: "Success is a state of mind. If you want success, start thinking of yourself as a success.",
    author: "Joyce Brothers",
  ),
  SuccessQuote(
    text: "Your limitation—it's only your imagination.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Opportunities don't happen. You create them.",
    author: "Chris Grosser",
  ),
  SuccessQuote(
    text: "Successful people do what unsuccessful people are not willing to do.",
    author: "Jim Rohn",
  ),

  // Overcoming Challenges
  SuccessQuote(
    text: "Challenges are what make life interesting, and overcoming them is what makes life meaningful.",
    author: "Joshua J. Marine",
  ),
  SuccessQuote(
    text: "Success is how high you bounce when you hit bottom.",
    author: "George S. Patton",
  ),
  SuccessQuote(
    text: "Failure is success in progress.",
    author: "Albert Einstein",
  ),
  SuccessQuote(
    text: "Don't let what you cannot do interfere with what you can do.",
    author: "John Wooden",
  ),
  SuccessQuote(
    text: "It's not whether you get knocked down; it's whether you get up.",
    author: "Vince Lombardi",
  ),
  SuccessQuote(
    text: "Obstacles are those frightful things you see when you take your eyes off your goal.",
    author: "Henry Ford",
  ),
  SuccessQuote(
    text: "The harder the battle, the sweeter the victory.",
    author: "Les Brown",
  ),
  SuccessQuote(
    text: "Success is never accidental.",
    author: "Jack Dorsey",
  ),
  SuccessQuote(
    text: "When you feel like quitting, think about why you started.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Your struggle today is your strength tomorrow.",
    author: "Unknown",
  ),

  // Staying Motivated
  SuccessQuote(
    text: "Success is the sum of small efforts, repeated day in and day out.",
    author: "Robert Collier",
  ),
  SuccessQuote(
    text: "Keep your eyes on the stars, and your feet on the ground.",
    author: "Theodore Roosevelt",
  ),
  SuccessQuote(
    text: "Motivation is what gets you started. Habit is what keeps you going.",
    author: "Jim Ryun",
  ),
  SuccessQuote(
    text: "You don't have to be great to start, but you have to start to be great.",
    author: "Zig Ziglar",
  ),
  SuccessQuote(
    text: "Energy and persistence conquer all things.",
    author: "Benjamin Franklin",
  ),
  SuccessQuote(
    text: "You are the architect of your own destiny.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Hustle beats talent when talent doesn't hustle.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "If you want to achieve greatness, stop asking for permission.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Your future is created by what you do today, not tomorrow.",
    author: "Robert Kiyosaki",
  ),
  SuccessQuote(
    text: "Success doesn't just find you; you have to go out and get it.",
    author: "Unknown",
  ),

  // Success and Courage
  SuccessQuote(
    text: "Courage is resistance to fear, mastery of fear—not absence of fear.",
    author: "Mark Twain",
  ),
  SuccessQuote(
    text: "Fortune favors the brave.",
    author: "Latin Proverb",
  ),
  SuccessQuote(
    text: "Act as if what you do makes a difference. It does.",
    author: "William James",
  ),
  SuccessQuote(
    text: "He who is not courageous enough to take risks will accomplish nothing in life.",
    author: "Muhammad Ali",
  ),
  SuccessQuote(
    text: "Success is not for the timid. It is for those who seek guidance, make decisions, and take decisive action.",
    author: "Jose Silva",
  ),
  SuccessQuote(
    text: "Be brave. Take risks. Nothing can substitute experience.",
    author: "Paulo Coelho",
  ),
  SuccessQuote(
    text: "A ship in harbor is safe, but that is not what ships are built for.",
    author: "John A. Shedd",
  ),
  SuccessQuote(
    text: "If you don't build your dream, someone else will hire you to help build theirs.",
    author: "Tony Gaskins",
  ),
  SuccessQuote(
    text: "Do one thing every day that scares you.",
    author: "Eleanor Roosevelt",
  ),
  SuccessQuote(
    text: "Leap, and the net will appear.",
    author: "John Burroughs",
  ),

  // Learning and Growth
  SuccessQuote(
    text: "Knowledge will give you power, but character respect.",
    author: "Bruce Lee",
  ),
  SuccessQuote(
    text: "Learn as if you will live forever, live like you will die tomorrow.",
    author: "Mahatma Gandhi",
  ),
  SuccessQuote(
    text: "Success is a journey, not a destination.",
    author: "Arthur Ashe",
  ),
  SuccessQuote(
    text: "The expert in anything was once a beginner.",
    author: "Helen Hayes",
  ),
  SuccessQuote(
    text: "An investment in knowledge pays the best interest.",
    author: "Benjamin Franklin",
  ),
  SuccessQuote(
    text: "Great things never come from comfort zones.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Do not fear failure but rather fear not trying.",
    author: "Roy T. Bennett",
  ),
  SuccessQuote(
    text: "Fall seven times and stand up eight.",
    author: "Japanese Proverb",
  ),
  SuccessQuote(
    text: "Success depends upon previous preparation, and without such preparation, there is sure to be failure.",
    author: "Confucius",
  ),
  SuccessQuote(
    text: "What seems to us as bitter trials are often blessings in disguise.",
    author: "Oscar Wilde",
  ),

  // Vision and Focus
  SuccessQuote(
    text: "A clear vision, backed by definite plans, gives you a tremendous feeling of confidence and personal power.",
    author: "Brian Tracy",
  ),
  SuccessQuote(
    text: "Focus on the possibilities for success, not on the potential for failure.",
    author: "Napoleon Hill",
  ),
  SuccessQuote(
    text: "Success is focusing the full power of all you are on what you have a burning desire to achieve.",
    author: "Wilfred Peterson",
  ),
  SuccessQuote(
    text: "What you focus on expands.",
    author: "T. Harv Eker",
  ),
  SuccessQuote(
    text: "If you don't know where you are going, you'll end up someplace else.",
    author: "Yogi Berra",
  ),
  SuccessQuote(
    text: "The secret of success is to do the common thing uncommonly well.",
    author: "John D. Rockefeller Jr.",
  ),
  SuccessQuote(
    text: "Perseverance is not a long race; it is many short races one after the other.",
    author: "Walter Elliot",
  ),
  SuccessQuote(
    text: "Success is stumbling from failure to failure with no loss of enthusiasm.",
    author: "Winston Churchill",
  ),
  SuccessQuote(
    text: "Don't stop until you're proud.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Never give up, for that is just the place and time that the tide will turn.",
    author: "Harriet Beecher Stowe",
  ),

  // Achieving Greatness
  SuccessQuote(
    text: "To achieve greatness, start where you are, use what you have, and do what you can.",
    author: "Arthur Ashe",
  ),
  SuccessQuote(
    text: "Greatness is not in where we stand, but in what direction we are moving.",
    author: "Oliver Wendell Holmes",
  ),
  SuccessQuote(
    text: "Don't be afraid to give up the good to go for the great.",
    author: "John D. Rockefeller",
  ),
  SuccessQuote(
    text: "Great things are not done by impulse, but by a series of small things brought together.",
    author: "Vincent Van Gogh",
  ),
  SuccessQuote(
    text: "The price of greatness is responsibility.",
    author: "Winston Churchill",
  ),
  SuccessQuote(
    text: "Small progress is still progress.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Success is nothing more than a few simple disciplines practiced every day.",
    author: "Jim Rohn",
  ),
  SuccessQuote(
    text: "Keep grinding; your day will come.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Greatness doesn't come from what you achieve; it comes from what you overcome.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Go the extra mile; it's never crowded.",
    author: "Wayne Dyer",
  ),

  // Inspiration for Action
  SuccessQuote(
    text: "Don't limit your challenges. Challenge your limits.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "What you get by achieving your goals is not as important as what you become by achieving your goals.",
    author: "Zig Ziglar",
  ),
  SuccessQuote(
    text: "Action is the foundational key to all success.",
    author: "Pablo Picasso",
  ),
  SuccessQuote(
    text: "Stop doubting yourself. Work hard and make it happen.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "The best way to predict the future is to create it.",
    author: "Peter Drucker",
  ),
  SuccessQuote(
    text: "You don't have to see the whole staircase; just take the first step.",
    author: "Martin Luther King Jr.",
  ),
  SuccessQuote(
    text: "Success is 1% inspiration, 99% perspiration.",
    author: "Thomas Edison",
  ),
  SuccessQuote(
    text: "Do what you can, with what you have, where you are.",
    author: "Theodore Roosevelt",
  ),
  SuccessQuote(
    text: "A goal without a plan is just a wish.",
    author: "Antoine de Saint-Exupéry",
  ),
  SuccessQuote(
    text: "Your passion is waiting for your courage to catch up.",
    author: "Isabelle Lafleche",
  ),

  // Confidence and Self-Belief
  SuccessQuote(
    text: "Believe in yourself and all that you are. Know that there is something inside you that is greater than any obstacle.",
    author: "Christian D. Larson",
  ),
  SuccessQuote(
    text: "Your potential is endless.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Doubt kills more dreams than failure ever will.",
    author: "Suzy Kassem",
  ),
  SuccessQuote(
    text: "You are capable of amazing things.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Confidence comes not from always being right but from not fearing to be wrong.",
    author: "Peter T. McIntyre",
  ),
  SuccessQuote(
    text: "Your only limit is your mind.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Believe in your infinite potential. Your only limitations are those you set upon yourself.",
    author: "Roy T. Bennett",
  ),
  SuccessQuote(
    text: "The man who has confidence in himself gains the confidence of others.",
    author: "Hasidic Proverb",
  ),
  SuccessQuote(
    text: "Turn your setbacks into comebacks.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "You were born to be great. Don't let anyone convince you otherwise.",
    author: "Unknown",
  ),

  // Success Through Passion
  SuccessQuote(
    text: "Choose a job you love, and you will never have to work a day in your life.",
    author: "Confucius",
  ),
  SuccessQuote(
    text: "Passion is the difference between having a job and having a career.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "The only way to do great work is to love what you do.",
    author: "Steve Jobs",
  ),
  SuccessQuote(
    text: "Find your passion, and it will lead you to your purpose.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "When your work speaks for itself, don't interrupt.",
    author: "Henry J. Kaiser",
  ),
  SuccessQuote(
    text: "Success is liking yourself, liking what you do, and liking how you do it.",
    author: "Maya Angelou",
  ),
  SuccessQuote(
    text: "Do what you love and the money will follow.",
    author: "Marsha Sinetar",
  ),
  SuccessQuote(
    text: "Pursue your passion, not your paycheck.",
    author: "Unknown",
  ),
  SuccessQuote(
    text: "Chase the vision, not the money; the money will end up following you.",
    author: "Tony Hsieh",
  ),
  SuccessQuote(
    text: "Success is not the key to happiness. Happiness is the key to success.",
    author: "Albert Schweitzer",
  ),
];
