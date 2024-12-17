import 'package:flutter/material.dart';
import 'dart:math' as math;

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late PageController _pageController;
  int _currentPage = 0;

  final List<Color> _gradientColors = const [
    Color(0xFF1A1A2E),
    Color(0xFF6C63FF),
    Color(0xFF4CAF50),
    Color(0xFFFFA726),
  ];

  final List<FeatureItem> _features = [
    FeatureItem(
      icon: Icons.favorite,
      title: 'Daily Inspiration',
      description: 'Get your daily dose of motivation with handpicked quotes',
      color: const Color(0xFF6C63FF),
    ),
    FeatureItem(
      icon: Icons.category,
      title: 'Multiple Categories',
      description: 'Browse through various categories of motivational quotes',
      color: const Color(0xFF4CAF50),
    ),
    FeatureItem(
      icon: Icons.bookmark,
      title: 'Save Favorites',
      description: 'Save your favorite quotes for quick access',
      color: const Color(0xFFFFA726),
    ),
    FeatureItem(
      icon: Icons.share,
      title: 'Share Quotes',
      description: 'Share inspiring quotes with friends and family',
      color: const Color(0xFFEF5350),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onDotTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated background
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: BackgroundPainter(
                    animation: _controller.value,
                    gradientColors: _gradientColors,
                    currentPage: _currentPage,
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // App Title with gradient and animation
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      const Color(0xFF6C63FF),
                      const Color(0xFF4CAF50),
                      const Color(0xFFFFA726),
                      _features[_currentPage].color,
                    ],
                    stops: const [0.0, 0.3, 0.6, 1.0],
                  ).createShader(bounds),
                  child: const Text(
                    'Daily Motivation',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Animated subtitle
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: Opacity(
                        opacity: value,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                _features[_currentPage].color.withOpacity(0.1),
                                Colors.white.withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'Your daily source of inspiration',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              shadows: [
                                Shadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                // Features PageView
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _features.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onHorizontalDragEnd: (details) {
                          if (details.primaryVelocity! < 0 && index < _features.length - 1) {
                            _onDotTapped(index + 1);
                          } else if (details.primaryVelocity! > 0 && index > 0) {
                            _onDotTapped(index - 1);
                          }
                        },
                        child: AnimatedScale(
                          scale: _currentPage == index ? 1.0 : 0.9,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: _currentPage == index ? 1.0 : 0.5,
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: _features[index].color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _features[index].color,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: _features[index].color.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: _currentPage == index ? 2 : 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _features[index].icon,
                                    size: 80,
                                    color: _features[index].color,
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    _features[index].title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                    child: Text(
                                      _features[index].description,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Page Indicator Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _features.length,
                    (index) => GestureDetector(
                      onTap: () => _onDotTapped(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: _currentPage == index ? 24 : 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? _features[index].color
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                // Get Started Button
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF4CAF50)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6C63FF).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: const Color(0xFF4CAF50).withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, -4),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        borderRadius: BorderRadius.circular(30),
                        splashColor: Colors.white.withOpacity(0.2),
                        highlightColor: Colors.white.withOpacity(0.1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 16,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) => const LinearGradient(
                                  colors: [Colors.white, Colors.white70],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds),
                                child: const Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureItem {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class BackgroundPainter extends CustomPainter {
  final double animation;
  final List<Color> gradientColors;
  final int currentPage;

  BackgroundPainter({
    required this.animation,
    required this.gradientColors,
    required this.currentPage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Create gradient background
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          gradientColors[0],
          gradientColors[currentPage + 1],
          gradientColors[0],
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 0.5, 1.0],
        transform: GradientRotation(animation * 2 * math.pi),
      ).createShader(rect);

    canvas.drawRect(rect, paint);

    // Draw animated circles
    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Draw multiple layers of circles
    for (var i = 0; i < 3; i++) {
      final circleAnimation = (animation + i / 3) % 1.0;
      final opacity = (1 - circleAnimation) * 0.4;
      final radius = 50.0 + (circleAnimation * 100) + (i * 50);

      circlePaint.color = gradientColors[currentPage + 1].withOpacity(opacity);

      // Draw multiple circles in each layer
      for (var j = 0; j < 5; j++) {
        final angle = (j / 5) * 2 * math.pi + (animation * 2 * math.pi);
        final offset = Offset(
          size.width * 0.5 + math.cos(angle) * radius,
          size.height * 0.5 + math.sin(angle) * radius,
        );
        canvas.drawCircle(offset, 8, circlePaint);
      }
    }

    // Draw floating particles
    final particlePaint = Paint()..style = PaintingStyle.fill;
    final random = math.Random(42);

    for (var i = 0; i < 50; i++) {
      final particleAnimation = (animation + random.nextDouble()) % 1.0;
      final opacity = (1 - particleAnimation) * 0.3;
      final size = random.nextDouble() * 4;

      particlePaint.color = gradientColors[random.nextInt(gradientColors.length)]
          .withOpacity(opacity);

      final x = random.nextDouble() * rect.width;
      final y = random.nextDouble() * rect.height;
      final offset = Offset(
        x + math.sin((animation + i) * 2 * math.pi) * 10,
        y + math.cos((animation + i) * 2 * math.pi) * 10,
      );

      canvas.drawCircle(offset, size, particlePaint);
    }

    // Draw subtle wave patterns
    final wavePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final path = Path();
    for (var i = 0; i < 3; i++) {
      wavePaint.color =
          gradientColors[currentPage + 1].withOpacity(0.1 + (i * 0.05));

      path.reset();
      for (var x = 0.0; x < size.width; x += 5) {
        final y = math.sin((x / size.width) * 4 * math.pi +
                (animation * 2 * math.pi) +
                (i * math.pi / 3)) *
            20;
        if (x == 0) {
          path.moveTo(x, size.height * 0.5 + y);
        } else {
          path.lineTo(x, size.height * 0.5 + y);
        }
      }
      canvas.drawPath(path, wavePaint);
    }
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) =>
      oldDelegate.animation != animation ||
      oldDelegate.currentPage != currentPage;
}
