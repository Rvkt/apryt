import 'package:apryt/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'core/app_colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> with TickerProviderStateMixin {
  late AnimationController _textAnimationController;
  late AnimationController _blobAnimationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<double> _shapeAnimation;

  @override
  void initState() {
    super.initState();

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textAnimationController, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _textAnimationController, curve: Curves.easeIn));

    _textAnimationController.forward();

    _blobAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _alignmentAnimation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _blobAnimationController, curve: Curves.easeInOut));

    _shapeAnimation = Tween<double>(
      begin: 0.5,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _blobAnimationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    _blobAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _blobAnimationController,
            builder: (context, child) {
              return CustomPaint(
                painter: BlobPainter(
                  progress: _blobAnimationController.value,
                  alignment: _alignmentAnimation.value,
                  sizeFactor: _shapeAnimation.value,
                ),
              );
            },
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.lightBlue100,
                  AppColors.lightBlue200,
                  AppColors.primaryBlue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: AppColors.semiTransparentWhite,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  '</>',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryBlue,
                                    fontFamily: 'monospace',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Welcome to Apryt!',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkBlue,
                                  fontFamily: 'monospace',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Text(
                                  'Start building your amazing Flutter app with a clean and modern UI.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey.shade500,
                                    height: 1.5,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'monospace',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 40),
                              InkWell(
                                onTap: () {
                                  // TODO: Add navigation logic here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DashboardScreen(),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      color: Color(0xFF0288D1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Image.asset(
                      'assets/images/lockup_built-w-flutter_wht.png',
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BlobPainter extends CustomPainter {
  final double progress;
  final Alignment alignment;
  final double sizeFactor;

  BlobPainter({
    required this.progress,
    required this.alignment,
    required this.sizeFactor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4FC3F7).withAlpha(150) // Light Blue Accent
      ..style = PaintingStyle.fill;

    final center = alignment.alongSize(size);
    final radius = size.width * 0.2 * sizeFactor;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
