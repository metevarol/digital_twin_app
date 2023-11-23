import 'package:flutter/material.dart';
import 'registration_screen.dart';

// ... Diğer importlar ...

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Digital Twin App")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType:
                  TextInputType.emailAddress, // E-posta için klavye türü
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Giriş işlemi için kod buraya
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Kayıt ekranına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()),
                );
              },
              child: const Text('Don\'t have an account? Sign up'),
            )
          ],
        ),
      ),
    );
  }
}
