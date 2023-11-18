import 'package:flutter/material.dart';
import 'registration_screen.dart';

// ... Diğer importlar ...

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Digital Twin App")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType:
                  TextInputType.emailAddress, // E-posta için klavye türü
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Giriş işlemi için kod buraya
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                // Kayıt ekranına yönlendirme
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationScreen()),
                );
              },
              child: Text('Don\'t have an account? Sign up'),
            )
          ],
        ),
      ),
    );
  }
}
