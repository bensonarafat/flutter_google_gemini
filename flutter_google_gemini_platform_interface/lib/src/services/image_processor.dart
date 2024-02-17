import 'dart:convert';
import 'dart:io';

class ImageProcessor {
  static Future<String> convertToBase(File image) async {
    final bytes = await image.readAsBytes();
    final base64Image = const Base64Encoder().convert(bytes);
    return base64Image;
  }
}
