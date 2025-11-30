package com.react_app.flutter

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class FlutterAzeooModule(reactContext: ReactApplicationContext) :
    ReactContextBaseJavaModule(reactContext) {

    override fun getName() = "FlutterAzeoo"

    @ReactMethod
    fun openProfile(userId: String) {
        val activity = reactApplicationContext.currentActivity ?: return
        FlutterAzeooActivity.start(activity, userId)
    }
}
