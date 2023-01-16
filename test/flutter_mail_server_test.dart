// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:flutter_mail_server/flutter_mail_server.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userMessage = TextEditingController();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: userName,
            ),
            TextFormField(
              controller: userEmail,
            ),
            TextFormField(
              controller: userMessage,
            ),
            ElevatedButton(
              onPressed: () {
                Mails().sendDirectMails(
                  userName.text,
                  userEmail.text,
                  userMessage.text,
                  const AlertDialog(
                    title: Text("Mail"),
                    content: Text("Email sent successfully"),
                  ),
                  const AlertDialog(
                    title: Text("Mail"),
                    content: Text("Sorry email not sent"),
                  ),
                );
              },
              child: const Text("send the email"),
            )
          ],
        ),
      ),
    );
  }
}
