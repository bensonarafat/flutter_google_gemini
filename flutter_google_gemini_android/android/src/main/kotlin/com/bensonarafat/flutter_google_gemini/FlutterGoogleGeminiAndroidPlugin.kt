package com.bensonarafat.flutter_google_gemini

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodChannel

class FlutterGoogleGeminiAndroidPlugin: FlutterPlugin{

    private val channel_name = "com.bensonarafat/flutter_google_gemini_android";
    private lateinit var channel: MethodChannel;

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) { 
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, channel_name);
        channel.setMethodCallHandler(FlutterGoogleGemini());
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) { 
        channel.setMethodCallHandler(null);
    }
}
