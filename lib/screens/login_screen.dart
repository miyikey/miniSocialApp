import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool hidePassword = true;
  String errorMessage = '';

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    setState(() {
      errorMessage = '';
    });

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorMessage = 'Please enter your email and password.';
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Fake login for now
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });

      // Later this will go to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'CampusLoop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Welcome back',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 40),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: isLoading ? null : login,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Log in'),
                ),

                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password?'),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}