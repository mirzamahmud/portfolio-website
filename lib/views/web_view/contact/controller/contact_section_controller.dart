import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio_website/models/contact/contact_model.dart';
import 'package:portfolio_website/service/firebase_service.dart';

class ContactSectionController extends GetxController {
  // =============================== firebase service ====================================
  late FirebaseService _firebaseService;

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

    try {
      await _firebaseService.addContacts(
        collectionPath: 'contacts',
        contact: ContactModel(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          subject: subjectController.text.trim(),
          message: messageController.text.trim(),
        ),
      );
      clearData();
    } catch (e) {
      debugPrint('Error: $e');
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
  void onInit() {
    super.onInit();
    _firebaseService = FirebaseService();
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
