import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

sendEmail(String email, String messageWelcome, String content) async {
  String username = 'lujainqm1@gmail.com';
  String password = 'hlbhuckrhjunkdfe';
  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'تراحم')
    ..recipients.add(email)
    ..subject = messageWelcome
    ..html = "<h1>$content</h1>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
