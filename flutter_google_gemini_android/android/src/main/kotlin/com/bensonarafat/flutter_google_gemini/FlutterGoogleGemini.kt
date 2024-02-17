package com.bensonarafat.flutter_google_gemini

import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.Log
import com.google.ai.client.generativeai.type.SafetySetting
import com.google.ai.client.generativeai.type.GenerationConfig
import com.google.ai.client.generativeai.type.GenerateContentResponse
import com.google.ai.client.generativeai.GenerativeModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.cancel
import kotlinx.coroutines.coroutineScope
import com.google.ai.client.generativeai.type.content
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import java.util.Base64

class FlutterGoogleGemini: MethodCallHandler {

    private val initialize = "initialize"

    private val close = "close"

    private val text = "text"

    private val textWithImage = "textWithImage"

    var scope = CoroutineScope(Dispatchers.IO)

    private lateinit var generativeModel : GenerativeModel;

    override fun onMethodCall(call: MethodCall, result: Result) { 
      scope.launch{
        val method : String = call.method
        if(method == initialize){
            handleInitialize(call, result)
        }else if(method == text){
            generateText(call, result)
        }else if(method == textWithImage){
            generateTextWithImage(call, result)
        }
        // else if(method == close){
        //     handleClose(call)
        // }
        else{
            result.notImplemented()
        }
      }
    }

    private fun handleInitialize(call: MethodCall, result: Result){
        var modelName: String =  call.argument<String>("model") ?: throw IllegalArgumentException("Missing argument: model")
        var apiKey: String = call.argument<String>("apikey") ?: throw IllegalArgumentException("Missing argument: apikey")
        // var configMap: Map<String, Any>? = call.argument<Map<String, Any>>("config")
        var config: GenerationConfig? = null
        // var safetySettingsList = call.argument<List<*>>("safetySettings")
        var safetySetting: List<SafetySetting>? = null
        try {
            generativeModel = GenerativeModel(
                modelName = modelName,
                apiKey = apiKey,
                generationConfig = config, 
                safetySettings = safetySetting
            )
            result.success(generativeModel.toString())
        }catch (e: Exception){
            //Log.e("MyTag",  "Error initializing GenerativeModel", e)
            result.error("Initialization Error", e.localizedMessage, null)
        }
    }

     private suspend fun generateText(call: MethodCall, result: Result){
        var prompt: String =  call.argument<String>("prompt") ?: throw IllegalArgumentException("Missing argument: prompt")
        try {
            var response : GenerateContentResponse =  generativeModel.generateContent(prompt) 
            response.text;
            result.success(response.text.toString());
        }
        catch(e: Exception) {
            result.error("Error generating text", e.message, e)
        }
        
       
    }

    private suspend fun generateTextWithImage(call: MethodCall, result: Result){
      
      if(generativeModel.modelName == "gemini-pro-vision"){
        var prompt: String =  call.argument<String>("prompt") ?: throw IllegalArgumentException("Missing argument: prompt")
        var images: List<String> = call.argument<List<String>>("images") ?: throw IllegalArgumentException("Missing argument: images")
        var bitmaps: ArrayList<Bitmap>  = processImages(images);
        val inputContent = content {
          for(bitmap in bitmaps){
            image(bitmap)
          }
          text(prompt) 
        }
        val response : GenerateContentResponse = generativeModel.generateContent(inputContent)
        result.success(response.text.toString());
      }else{
        result.error("Error generating text from Text and Image input (multimodal)", "(Multimodel) To generate text from text and image input. You need to use the gemini-pro-vision model" , null)
      }
    }

    private fun processImages(images: List<String>) : ArrayList<Bitmap>
    {
      val bitmaps: ArrayList<Bitmap> = ArrayList();
      for(image in images){
        val bytes = Base64.getDecoder().decode(image)
        val bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.size, BitmapFactory.Options().apply{})
        bitmaps.add(bitmap)
      }
      return bitmaps;
    }
    // private fun handleClose(call: MethodCall){
    //     scope.cancel()
    // }
    
}
