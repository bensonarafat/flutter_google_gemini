import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_google_gemini_platform_interface/flutter_google_gemini.dart';

class FlutterGoogleGeminiAndroid
    extends FlutterGoogleGeminiPlatformInterfacePlatform {
  /// The method channel used to interact with the native platform.
  static const _channel =
      MethodChannel("com.bensonarafat/flutter_google_gemini_android");

  /// Registers this class as the default instance of [FlutterGoogleGeminiPlatformInterfacePlatform].
  static void registerWith() {
    FlutterGoogleGeminiPlatformInterfacePlatform.instance =
        FlutterGoogleGeminiAndroid();
  }

  @override
  Future<void> initialize({
    required String modelName,
    required String apiKey,
    GenerationConfig? config,
    List<SafetySettings>? safetySettings,
  }) async {
    await _channel.invokeMethod('initialize', <String, dynamic>{
      'model': modelName,
      'apikey': apiKey,
      'config': config,
      'safetySettings': safetySettings,
    });
  }

  @override
  Future<String?> text({required String prompt}) async {
    String? text = await _channel
        .invokeMethod('text', <String, dynamic>{"prompt": prompt});
    return text;
  }

  @override
  Future<String?> textWithImage(
      {required String prompt, required List<File> images}) async {
    String? text =
        await _channel.invokeMethod("textWithImage", <String, dynamic>{
      "prompt": prompt,
      "images":
          images.map((File file) => ImageProcessor.convertToBase(file)).toList()
    });
    return text;
  }

  @override
  Future<void> close() async {
    return await _channel.invokeMethod('close');
  }
}
