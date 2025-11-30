package com.react_app

import android.app.Application
import com.facebook.react.PackageList
import com.facebook.react.ReactApplication
import com.facebook.react.ReactHost
import com.facebook.react.ReactNativeApplicationEntryPoint.loadReactNative
import com.facebook.react.defaults.DefaultReactHost.getDefaultReactHost

// 👉 IMPORT pour ton package natif Flutter
import com.react_app.flutter.FlutterAzeooPackage

class MainApplication : Application(), ReactApplication {

    override val reactHost: ReactHost by lazy {
        getDefaultReactHost(
            context = applicationContext,

            // 👉 Liste des packages RN (autolinkés + manuels)
            packageList =
                PackageList(this).packages.apply {
                    /**
                     * Packages non-autolinked → ajout manuel
                     * Ici on ajoute ton view manager Flutter
                     */
                    add(FlutterAzeooPackage())
                },
        )
    }

    override fun onCreate() {
        super.onCreate()
        loadReactNative(this)
    }
}
