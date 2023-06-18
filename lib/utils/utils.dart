import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}
PickImage(ImageSource source) async {
  final ImagePicker _imagepicker = ImagePicker();
  final XFile? _file = await _imagepicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
}