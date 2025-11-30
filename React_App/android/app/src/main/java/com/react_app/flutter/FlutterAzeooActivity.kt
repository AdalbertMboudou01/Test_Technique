package com.react_app.flutter

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class FlutterAzeooActivity : FlutterActivity() {

    companion object {
        private const val ENGINE_ID = "azeoo_engine"

        fun start(activity: Activity, userId: String) {
            val intent = Intent(activity, FlutterAzeooActivity::class.java)
            intent.putExtra("userId", userId)
            activity.startActivity(intent)
        }
    }

    override fun provideFlutterEngine(context: android.content.Context): FlutterEngine? {
        val engine = FlutterEngine(context)
        val userId = intent.getStringExtra("userId") ?: "1"

        engine.navigationChannel.setInitialRoute("/profile?userId=$userId")

        engine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        FlutterEngineCache
            .getInstance()
            .put(ENGINE_ID, engine)

        return engine
    }
}
