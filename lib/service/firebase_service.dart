import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website/firebase_options.dart';
import 'package:portfolio_website/models/contact/contact_model.dart';

class FirebaseService {
  // Singleton pattern
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  // Firebase instances
  static late FirebaseFirestore firestore;

  // Initialize Firebase
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    firestore = FirebaseFirestore.instance;
  }

  // ----------------------------------------------------------- Firestore Methods --------------------------------------------------------
  /// add contacts to a collection
  Future<DocumentReference> addContacts({
    required String collectionPath,
    required ContactModel contact,
  }) async {
    try {
      return await firestore.collection(collectionPath).add(contact.toMap());
    } catch (e) {
      throw Exception('Failed to add document: $e');
    }
  }
}
