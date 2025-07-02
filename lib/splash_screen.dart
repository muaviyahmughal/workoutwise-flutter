import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'components/app_button.dart';
import 'theme.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onFinish;
  const SplashScreen({super.key, required this.onFinish});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _videoReady = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/barbell-splash.mp4')
          ..initialize().then((_) {
            setState(() {
              _videoReady = true;
            });
            _controller.setLooping(true);
            _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onGetStarted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarded', true);
    widget.onFinish();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top: Heading and body text
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
                left: 32.0,
                right: 32.0,
                bottom: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to WorkoutWise',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Get real-time feedback on your form, count reps, and track your progress. Start your fitness journey now!',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color.fromARGB(
                        (0.7 * 255).round(),
                        (AppColors.primary.r * 255.0).round() & 0xff,
                        (AppColors.primary.g * 255.0).round() & 0xff,
                        (AppColors.primary.b * 255.0).round() & 0xff,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Middle: Video (smaller)
            if (_videoReady)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            const Spacer(),
            // Bottom: Button
            Padding(
              padding: const EdgeInsets.only(
                bottom: 32.0,
                left: 32.0,
                right: 32.0,
              ),
              child: AppButton(
                label: 'Get Started',
                onPressed: _onGetStarted,
                loading: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
