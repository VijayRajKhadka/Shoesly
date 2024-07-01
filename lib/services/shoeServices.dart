import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;


  Future<void> addShoes()async {
    try {

      await _firestore.collection('shoes').add({
        'name': "Puma X-Ray Speed Sneakers",
        'brand': "Puma",
        'description': "High end quality product with excellent build quality and long lasting material. Made to Fly.",
        'price': 417.99,
        'image': "puma2.jpeg",
        'category': "Women"
      });

      print('Shoe added successfully.');
    } catch (e) {
      print('Error adding shoe: $e');
      throw e;
    }
  }



}
