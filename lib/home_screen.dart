import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return Scaffold(
      appBar: AppBar(title: const Text('WorkoutWise Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Icon(
                _apiHealthy ? Icons.check_circle : Icons.error,
                color: _apiHealthy ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Text(
                _healthMessage ??
                    (_checkingHealth ? 'Checking API health...' : 'Unknown'),
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _checkingHealth ? null : _checkApiHealth,
                tooltip: 'Refresh',
              ),
            ],
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('Start New Workout'),
            subtitle: const Text('Choose plank or squat'),
            onTap: () {
              // TODO: Navigate to workout type selection
            },
          ),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: const Text('Upload/Record Video'),
            subtitle: const Text('Analyze a workout video'),
            onTap: () {
              // TODO: Navigate to video upload/record
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('View Feedback/Results'),
            subtitle: const Text('See your latest workout feedback'),
            onTap: () {
              // TODO: Navigate to feedback/results
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('Workout History'),
            subtitle: const Text('View your workout history'),
            onTap: () {
              // TODO: Navigate to workout history
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile/Settings'),
            subtitle: const Text('View and edit your profile'),
            onTap: () {
              // TODO: Navigate to profile/settings
            },
          ),
        ],
      ),
    );
  }
}
