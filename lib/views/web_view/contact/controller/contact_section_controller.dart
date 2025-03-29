import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ContactSectionController extends GetxController {
  // =============================== text field variables ================================

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode subjectFocusNode = FocusNode();
  FocusNode messageFocusNode = FocusNode();
  final GlobalKey contactFormKey = GlobalKey<FormState>();

  Rx<bool> isSubmit = false.obs;

  Future<void> submitForm() async {
    isSubmit.value = true;
    String username = 'mirza.dev25@gmail.com';
    String password = 'vhhq gwng lhvu leye'; // Use the App Password

    final smtpServer = gmail(username, password);

    final messageToSend =
        Message()
          ..from = Address(username, 'Mirza Mahmud Hossan')
          ..recipients.add(username) // Receiver Email
          ..subject = subjectController.text.trim()
          ..text =
              "Dear Mirza Mahmud,\nI hope you are well.\n\nFrom: ${nameController.text.trim()}\nEmail: ${emailController.text.trim()}\n\n${messageController.text.trim()}";

    try {
      clearData();
      await send(messageToSend, smtpServer);
    } catch (e) {
      debugPrint('Error Sending Email: $e');
    }
    isSubmit.value = false;
  }

  void clearData() {
    nameController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
