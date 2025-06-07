package io.rvkt.apryt

import android.Manifest
import android.util.Log
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.bluetooth.BluetoothManager
import android.bluetooth.BluetoothProfile
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

import android.bluetooth.BluetoothSocket
import java.io.OutputStream
import java.nio.charset.Charset
import java.util.UUID


class MainActivity: FlutterActivity() {
    private val CHANNEL = "bluetooth_channel"
    private val BLUETOOTH_PERMISSION_REQUEST_CODE = 100
    private lateinit var methodChannel: MethodChannel
    private lateinit var bluetoothServiceHandler: BluetoothServiceHandler


    private val bluetoothManager: BluetoothManager? by lazy {
        getSystemService(Context.BLUETOOTH_SERVICE) as? BluetoothManager
    }

    private val bluetoothAdapter: BluetoothAdapter? by lazy {
        bluetoothManager?.adapter
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        bluetoothServiceHandler = BluetoothServiceHandler(this) { method, resultArg ->
            methodChannel.invokeMethod(method, resultArg)
        }


        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {

                "printText" -> {
                    val macAddress = call.argument<String>("macAddress")
                    val text = call.argument<String>("text")
                    if (macAddress != null && text != null) {
                        bluetoothServiceHandler.printText(macAddress, text)
                        result.success(null)
                    } else {
                        result.error("INVALID_ARGUMENTS", "MAC address or text missing.", null)
                    }
                }

                "getPairedDevices" -> {
                    bluetoothServiceHandler.getPairedDevices(result)
                }

                "isBluetoothEnabled" -> {
                    result.success(bluetoothServiceHandler.isBluetoothEnabled())
                }

                "isBluetoothSupported" -> {
                    result.success(bluetoothServiceHandler.isBluetoothSupported())
                }

                "hasBluetoothPermission" -> {
                    result.success(bluetoothServiceHandler.hasBluetoothPermission())
                }

                "requestBluetoothPermission" -> {
                    bluetoothServiceHandler.requestBluetoothPermissions(this, BLUETOOTH_PERMISSION_REQUEST_CODE)
                    result.success(null)
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
