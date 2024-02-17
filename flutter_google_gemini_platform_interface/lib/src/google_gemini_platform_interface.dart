import 'dart:io';

import 'package:flutter_google_gemini_platform_interface/src/model/generation_config.dart';
import 'package:flutter_google_gemini_platform_interface/src/model/safety_settings.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'google_gemini_platform_interface_method_channel.dart';

abstract class FlutterGoogleGeminiPlatformInterfacePlatform
    extends PlatformInterface {
  /// Constructs a FlutterGoogleGeminiPlatformInterfacePlatform.
  FlutterGoogleGeminiPlatformInterfacePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterGoogleGeminiPlatformInterfacePlatform _instance =
      MethodChannelFlutterGoogleGeminiPlatform();

  /// The default instance of [FlutterGoogleGeminiPlatformInterfacePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterGoogleGeminiPlatformInterface].
  static FlutterGoogleGeminiPlatformInterfacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterGoogleGeminiPlatformInterfacePlatform] when
  /// they register themselves.
  static set instance(FlutterGoogleGeminiPlatformInterfacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize({
    // The name of the model to query. To list compatible models use
    required String modelName,
    // API key, if you don't already have one, create a key in Google AI Studio
    required String apiKey,
    // A genai.GenerationConfig setting the default generation parameters to use.
    GenerationConfig? config,
    // List the default safety filters. This controls which content is blocked by the api before being returned.
    List<SafetySettings>? safetySettings,
  }) async =>
      throw UnimplementedError('Initialize() has not been implemented');

  Future<String?> text({required String prompt}) async =>
      throw UnimplementedError('generateText() has not been implemented');

  Future<String?> textWithImage(
          {required String prompt, required List<File> images}) async =>
      throw UnimplementedError(
          'generateTextWithImage() has not been implemented');

  //Dispose the method channels
  Future<void> close() async =>
      throw UnimplementedError('close() has not been implemeted.');
}
