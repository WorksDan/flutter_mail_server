<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

The main feature of this library is to help people send emails while using the flutter app
without having to use any third-party native apps.. this sends the email directly to the provided
email in the function declaration

## Getting started

To get started with the package all that simply needs to be done is to add
the dependency name to your flutter project's "pubspec.yaml" file.

## Usage

<!-- TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. -->

```dart

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
                //function declaration starts here
                Mails().sendDirectMails(
                  userName.text,
                  userEmail.text,
                  userMessage.text,

                  //This dialog will only be shown if email is sent successfully
                  const AlertDialog(
                    title: Text("Mail"),
                    content: Text("Email sent successfully"),
                  ),

                  //This dialog comes up incase the email doesn't send for any reason
                  const AlertDialog(
                    title: Text("Mail"),
                    content: Text("Sorry email not sent"),
                  ),
                );

                //function declaration ends here
              },
              child: const Text("send the email"),
            )
          ],
        ),
      ),
    );
  }
}

```

## Additional information

The mailing function takes 5 parameters..
The first parameter takes the name of the mailer.
The second is takes name of the email of the mailer.
The third is the message the user wants to convey.
the fourth accepts a "success" message if the mail was sent successfully
the fifth accepts an "error" message just incase there is any one and to avoid application crashing
The best part is that the variables are declared dynamically
so there is no restriction to just "String" variables. Use that flexibility to the best
of your taste.

<!-- TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more. -->
