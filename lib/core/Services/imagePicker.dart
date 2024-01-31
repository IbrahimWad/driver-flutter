//import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  final _picker = ImagePicker();

  Future<PickedFile?> getImage(imageName, imagePath) async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // imageName = File(pickedFile.path);
      // imagePath = pickedFile.path;
      print(imagePath);

      return pickedFile;
    } else {
      return null;
      // print('No image selected.');
    }
  }
}
