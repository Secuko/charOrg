import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';


class FlutterImagePicker {
  static Future<XFile?> get getImage async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      return image;
    }
    else {
      return null;
    }
  }
}