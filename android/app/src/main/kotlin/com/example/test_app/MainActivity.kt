package com.example.test_app

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setLocale("en_EN") 
    MapKitFactory.setApiKey("e9bcf0bc-a15b-4c8f-8bd2-558fd15a885e") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}