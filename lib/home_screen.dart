import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _apiHealthy = true;
  bool _checkingHealth = false;
  String? _healthMessage;

  @override
  void initState() {
    super.initState();
    _checkApiHealth();
  }

  Future<void> _checkApiHealth() async {
    setState(() {
      _checkingHealth = true;
    });
    try {
      final resp = await http.get(Uri.parse('http://<your-backend>/health'));
      if (resp.statusCode == 200) {
        setState(() {
          _apiHealthy = true;
          _healthMessage = 'API is healthy';
        });
      } else {
        setState(() {
          _apiHealthy = false;
          _healthMessage = 'API error: \\${resp.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _apiHealthy = false;
        _healthMessage = 'API is not reachable';
      });
    } finally {
      setState(() {
        _checkingHealth = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkoutWise Home', style: theme.textTheme.titleMedium),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Icon(
                _apiHealthy ? Icons.check_circle : Icons.error,
                color: _apiHealthy ? AppColors.success : AppColors.error,
              ),
              const SizedBox(width: 8),
              Text(
                _healthMessage ??
                    (_checkingHealth ? 'Checking API health...' : 'Unknown'),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                ),
              ),
              IconButton(
                icon: Icon(Icons.refresh, color: AppColors.primary),
                onPressed: _checkingHealth ? null : _checkApiHealth,
                tooltip: 'Refresh',
              ),
            ],
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: Icon(Icons.fitness_center, color: AppColors.primary),
            title: Text(
              'Start New Workout',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              'Choose plank or squat',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Color.fromARGB(
                  (0.6 * 255).round(),
                  (AppColors.primary.r * 255.0).round() & 0xff,
                  (AppColors.primary.g * 255.0).round() & 0xff,
                  (AppColors.primary.b * 255.0).round() & 0xff,
                ),
              ),
            ),
            onTap: () {
              // TODO: Navigate to workout type selection
            },
          ),
          ListTile(
            leading: Icon(Icons.videocam, color: AppColors.primary),
            title: Text(
              'Upload/Record Video',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              'Analyze a workout video',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Color.fromARGB(
                  (0.6 * 255).round(),
                  (AppColors.primary.r * 255.0).round() & 0xff,
                  (AppColors.primary.g * 255.0).round() & 0xff,
                  (AppColors.primary.b * 255.0).round() & 0xff,
                ),
              ),
            ),
            onTap: () {
              // TODO: Navigate to video upload/record
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: AppColors.primary),
            title: Text(
              'View Feedback/Results',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              'See your latest workout feedback',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Color.fromARGB(
                  (0.6 * 255).round(),
                  (AppColors.primary.r * 255.0).round() & 0xff,
                  (AppColors.primary.g * 255.0).round() & 0xff,
                  (AppColors.primary.b * 255.0).round() & 0xff,
                ),
              ),
            ),
            onTap: () {
              // TODO: Navigate to feedback/results
            },
          ),
          ListTile(
            leading: Icon(Icons.history, color: AppColors.primary),
            title: Text(
              'Workout History',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              'View your workout history',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Color.fromARGB(
                  (0.6 * 255).round(),
                  (AppColors.primary.r * 255.0).round() & 0xff,
                  (AppColors.primary.g * 255.0).round() & 0xff,
                  (AppColors.primary.b * 255.0).round() & 0xff,
                ),
              ),
            ),
            onTap: () {
              // TODO: Navigate to workout history
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: AppColors.primary),
            title: Text(
              'Profile/Settings',
              style: theme.textTheme.titleMedium?.copyWith(
                color: AppColors.primary,
              ),
            ),
            subtitle: Text(
              'View and edit your profile',
              style: theme.textTheme.bodySmall?.copyWith(
                color: Color.fromARGB(
                  (0.6 * 255).round(),
                  (AppColors.primary.r * 255.0).round() & 0xff,
                  (AppColors.primary.g * 255.0).round() & 0xff,
                  (AppColors.primary.b * 255.0).round() & 0xff,
                ),
              ),
            ),
            onTap: () {
              // TODO: Navigate to profile/settings
            },
          ),
        ],
      ),
    );
  }
}
