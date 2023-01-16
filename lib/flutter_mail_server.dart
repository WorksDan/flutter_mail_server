// ignore_for_file: non_constant_identifier_names, avoid_print

library flutter_mail_server;

// this class mails is meant for the sole sake of being able to send emails in flutter.
// this especially comes handy in business owner whose apps are created with flutter.
import 'dart:convert';
import 'package:http/http.dart' as http;

class Mails {
  // this is the function 'sendDirectMails' that will be called in flutter
  // to receive controller inputs from the app ui (TextFormField to be precise).
  Future<dynamic> sendDirectMails(
      user_id, email_id, mail_message, PASS_MESSAGE, ERROR_MESSAGE) async {
    // if the dynamic variables are empty
    if (user_id == "" || email_id == "" || mail_message == "") {
      print("sorry, one of the fields are empty");
    } else {
      // this is a try and catch block to avoid future unprecedented errors
      try {
        // this is the url for the backend connectivity
        Uri url = Uri.parse(
            "https://isodynamic-stocks.000webhostapp.com/mailer/flutter_mail_server.php");

        // CHANGE THE EMAIL HERE TO YOUR COMPANY MAIL
        var yourEmail = "youremail@gmail.com";

        // this is the response from dart(Flutter) to the mail_server
        var response = await http.post(url, body: {
          "user_name": user_id,
          "email_name": email_id,
          "mail_content": mail_message,
          "comp_mail": yourEmail,
        });

        // json decoding the response returned from the server
        var data = json.decode(response.body);

        //  if the decoded data gotten from the 'response' is 'mail_sent_success'
        if (data == "mail_sent_success") {
          // the PASS_MESSAGE variable will be required when declaring the function
          return PASS_MESSAGE;
        } else {
          // the ERROR_MESSAGE variable will be required when declaring the function
          return ERROR_MESSAGE;
        }
      } catch (e) {
        // if a major error occurs within the function,
        // this should return an error message without crashing the application
        return e;
      }
    }
  }
}
