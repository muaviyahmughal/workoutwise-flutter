import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'components/app_app_bar.dart';
import 'components/app_button.dart';
import 'components/app_text_field.dart';
import 'theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _signup() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    try {
      final res = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      if (res.user != null && res.session != null) {
        // Create profile row for the new user
        final userId = res.user!.id;
        await Supabase.instance.client.from('profiles').insert({
          'user_id': userId,
          'display_name': email,
          'avatar_url': null,
        });
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed('/'); // Go to home
      } else {
        setState(() {
          _error = 'Signup failed. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: const AppAppBar(title: 'Sign Up'),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create Account',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign up to start your fitness journey',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Color.fromARGB(
                      (0.6 * 255).round(),
                      (AppColors.primary.r * 255.0).round() & 0xff,
                      (AppColors.primary.g * 255.0).round() & 0xff,
                      (AppColors.primary.b * 255.0).round() & 0xff,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                if (_error != null) ...[
                  Text(
                    _error!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                AppButton(
                  label: 'Sign Up',
                  onPressed: _loading ? null : _signup,
                  loading: _loading,
                ),
                const SizedBox(height: 8),
                AppButton(
                  label: 'Already have an account? Login',
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  type: AppButtonType.secondary,
                ),
                const SizedBox(height: 32),
                Text(
                  'By signing up, you agree to our Terms of Service and Privacy Policy.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Color.fromARGB(
                      (0.4 * 255).round(),
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
        ),
      ),
    );
  }
}
