package com.tla.bookapp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin
import com.tla.bookapp.NativeAdFactoryExample

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // تسجيل الـ NativeAdFactory
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "adFactoryExample",
            NativeAdFactoryExample(this) // ✅ تم التعديل هنا
        )
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        // إزالة تسجيل الـ NativeAdFactory عند الإغلاق
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "adFactoryExample")
        super.cleanUpFlutterEngine(flutterEngine)
    }
}