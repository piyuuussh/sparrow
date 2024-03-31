import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Firebasemethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadimage(Uint8List file) async {
    final Reference ref = _storage
        .ref()
        .child("images")
        .child(_firestore.collection('Hindi').doc().id);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> getdetails({
    required String name,
    required String description,
    required int index,
    required Uint8List image,
  }) async {
    String res = "Some error occured";
    try {
      _firestore.collection('Hindi').doc(index.toString()).set({
        'name': name,
        'description': description,
        'index': index,
        'image': await uploadimage(image),
      });
      print("$index added to the database");
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  pickimage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);

    if (image != null) {
      return await image.readAsBytes();
    }
    return ("No images selected");
  }
}
