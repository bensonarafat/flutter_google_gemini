import 'package:flutter_google_gemini_platform_interface/src/enum/safety_category.dart';
import 'package:flutter_google_gemini_platform_interface/src/enum/safety_threshold.dart';

class SafetySettings {
  // Required. The category for this setting.
  final SafetyCategory category;

  //Required. Controls the probability threshold at which harm is blocked.
  final SafetyThreshold threshold;

  SafetySettings({
    required this.category,
    required this.threshold,
  });
}
