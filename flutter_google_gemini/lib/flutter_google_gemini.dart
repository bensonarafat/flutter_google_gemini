import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_google_gemini_platform_interface/flutter_google_gemini.dart';

class FlutterGoogleGemini {
  FlutterGoogleGemini._();

  FlutterGoogleGeminiPlatformInterfacePlatform get _platform =>
      FlutterGoogleGeminiPlatformInterfacePlatform.instance;

  static Future<void> initialize({
    // The name of the model to query. To list compatible models use
    required String modelName,
    // API key, if you don't already have one, create a key in Google AI Studio
    required String apiKey,
    // A genai.GenerationConfig setting the default generation parameters to use.
    GenerationConfig? config,
    // List the default safety filters. This controls which content is blocked by the api before being returned.
    List<SafetySettings>? safetySettings,
  }) async {
    // Create an instance
    final instance = FlutterGoogleGemini._();
    try {
      // Access _platform through the instance
      await instance._platform.initialize(
        modelName: modelName,
        apiKey: apiKey,
        config: config,
        safetySettings: safetySettings,
      );
    } on PlatformException catch (_) {}
  }

  static Future<String?> text({required String prompt}) async {
    // Create an instance
    final instance = FlutterGoogleGemini._();
    try {
      String? text = await instance._platform.text(prompt: prompt);
      return text;
    } on PlatformException catch (_) {
      throw Exception("$_ Errror here");
    } catch (_) {
      throw Exception("$_ Error here");
    }
  }

  static Future<String?> textWithImage(
      {required String prompt, required List<File> images}) async {
    final instance = FlutterGoogleGemini._();
    try {
      String? text = await instance._platform.textWithImage(
        prompt: prompt,
        images: images,
      );
      return text;
    } on PlatformException catch (_) {
      throw Exception("$_ Errror here");
    } catch (_) {
      throw Exception("$_ Error here");
    }
  }
}
