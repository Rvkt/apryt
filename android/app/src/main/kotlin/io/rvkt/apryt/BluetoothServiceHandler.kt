package io.rvkt.apryt

import android.Manifest
import android.bluetooth.*
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.plugin.common.MethodChannel
import java.nio.charset.Charset
import java.util.*

import io.flutter.embedding.android.FlutterActivity


class BluetoothServiceHandler(
    private val context: Context,
    private val resultCallback: (String, Any?) -> Unit
) {
    private val bluetoothManager: BluetoothManager? =
        context.getSystemService(Context.BLUETOOTH_SERVICE) as? BluetoothManager

    private val bluetoothAdapter: BluetoothAdapter? = bluetoothManager?.adapter

    fun printText(macAddress: String, text: String) {
        Thread {
            try {
                val device: BluetoothDevice? = bluetoothAdapter?.bondedDevices?.find { it.address == macAddress }
                if (device == null) {
                    Log.d("PrintText", "Device not found.")
                    return@Thread
                }

                val uuid = UUID.fromString("00001101-0000-1000-8000-00805F9B34FB")
                val socket = device.createRfcommSocketToServiceRecord(uuid)

                bluetoothAdapter!!.cancelDiscovery()

                socket.connect()

                val outputStream = socket.outputStream

                val escPosCommand = byteArrayOf(
                    0x1B, 0x40,
                    *text.toByteArray(Charset.forName("GBK")),
                    0x0A, 0x0A, 0x0A
                )

                outputStream.write(escPosCommand)
                outputStream.flush()
                Thread.sleep(1000)
                outputStream.close()
                socket.close()

                Log.d("PrintText", "Print successful.")
            } catch (e: Exception) {
                Log.e("PrintText", "Error printing: ${e.message}", e)
            }
        }.start()
    }

    fun getPairedDevices(result: MethodChannel.Result) {
        if (!hasBluetoothPermission()) {
            result.error("PERMISSION_DENIED", "Bluetooth permission not granted", null)
            return
        }

        try {
            val pairedDevices = bluetoothAdapter?.bondedDevices?.map {
                createDeviceMap(it, false)
            } ?: emptyList()

            result.success(pairedDevices)
        } catch (e: Exception) {
            result.error("ERROR", "Failed to get paired devices: ${e.message}", null)
        }
    }

    fun isBluetoothEnabled(): Boolean = bluetoothAdapter?.isEnabled == true

    fun isBluetoothSupported(): Boolean = bluetoothAdapter != null

    fun hasBluetoothPermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            ContextCompat.checkSelfPermission(context, Manifest.permission.BLUETOOTH_CONNECT) ==
                    PackageManager.PERMISSION_GRANTED
        } else {
            ContextCompat.checkSelfPermission(context, Manifest.permission.BLUETOOTH) ==
                    PackageManager.PERMISSION_GRANTED &&
                    ContextCompat.checkSelfPermission(context, Manifest.permission.ACCESS_FINE_LOCATION) ==
                    PackageManager.PERMISSION_GRANTED
        }
    }

    fun requestBluetoothPermissions(activity: FlutterActivity, requestCode: Int) {
        val permissions = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            arrayOf(Manifest.permission.BLUETOOTH_CONNECT, Manifest.permission.BLUETOOTH_SCAN)
        } else {
            arrayOf(Manifest.permission.BLUETOOTH, Manifest.permission.BLUETOOTH_ADMIN, Manifest.permission.ACCESS_FINE_LOCATION)
        }
        ActivityCompat.requestPermissions(activity, permissions, requestCode)
    }

    private fun createDeviceMap(device: BluetoothDevice, isConnected: Boolean): Map<String, Any> {
        return mapOf(
            "name" to (device.name ?: "Unknown"),
            "address" to device.address,
            "isConnected" to isConnected,
            "bondState" to when (device.bondState) {
                BluetoothDevice.BOND_BONDED -> "bonded"
                BluetoothDevice.BOND_BONDING -> "bonding"
                else -> "none"
            },
            "type" to when (device.type) {
                BluetoothDevice.DEVICE_TYPE_CLASSIC -> "classic"
                BluetoothDevice.DEVICE_TYPE_LE -> "le"
                BluetoothDevice.DEVICE_TYPE_DUAL -> "dual"
                else -> "unknown"
            }
        )
    }
}
