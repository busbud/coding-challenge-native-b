package com.filipebrandao.busbudchallenge.ui.base

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.filipebrandao.busbudchallenge.common.logging.ILogger
import org.koin.android.ext.android.inject

open class BaseActivity : AppCompatActivity() {

    protected val logger: ILogger by inject()

    override fun onCreate(savedInstanceState: Bundle?) {
        logger.v(javaClass.simpleName, "onCreate")
        super.onCreate(savedInstanceState)
    }

    override fun onResume() {
        logger.v(javaClass.simpleName, "onResume")
        super.onResume()
    }

    override fun onStart() {
        logger.v(javaClass.simpleName, "onStart")
        super.onStart()
    }

    override fun onPause() {
        logger.v(javaClass.simpleName, "onPause")
        super.onPause()
    }

    override fun onStop() {
        logger.v(javaClass.simpleName, "onStop")
        super.onStop()
    }

    override fun onDestroy() {
        logger.v(javaClass.simpleName, "onDestroy")
        super.onDestroy()
    }
}
