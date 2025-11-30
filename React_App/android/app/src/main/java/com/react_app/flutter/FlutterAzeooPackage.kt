package com.react_app.flutter

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager

class FlutterAzeooPackage : ReactPackage {

    override fun createNativeModules(reactContext: ReactApplicationContext): List<NativeModule> {
        return listOf(FlutterAzeooModule(reactContext))
    }

    override fun createViewManagers(reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
        return emptyList()
    }
}
