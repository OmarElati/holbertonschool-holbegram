import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {

  Future<String> uploadImageToStorage(File file) async {
    String id = const Uuid().v1();
    final imagePath = "posts_images/$id.png";

    Reference reference = FirebaseStorage.instance.ref().child(imagePath);

    await reference.putFile(file);
    String downloadUrl = await reference.getDownloadURL();

    return downloadUrl;
  }
}
