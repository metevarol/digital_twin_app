import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Ekranı")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
                decoration: InputDecoration(labelText: 'Kullanıcı Adı')),
            const TextField(
              decoration: InputDecoration(labelText: 'Şifre'),
              obscureText: true,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Şifre Tekrarı'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kayıt işlemi için kod buraya
              },
              child: const Text('Kaydı Tamamla'),
            ),
          ],
        ),
      ),
    );
  }
}
