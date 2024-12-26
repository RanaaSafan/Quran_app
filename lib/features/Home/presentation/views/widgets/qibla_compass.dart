import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:vector_math/vector_math.dart' as vector;

class QiblaCompass extends StatefulWidget {
  @override
  _QiblaCompassState createState() => _QiblaCompassState();
}

class _QiblaCompassState extends State<QiblaCompass> {
  double _qiblaDirection = 0; // اتجاه القبلة
  double _deviceHeading = 0; // اتجاه الجهاز
  bool _isLocationError = false; // حالة الخطأ في الموقع

  @override
  void initState() {
    super.initState();
    _initializeCompass();
  }

  Future<void> _initializeCompass() async {
    try {
      // الحصول على الموقع الحالي
      await _getCurrentPosition();

      // الاستماع إلى حساسات البوصلة
      _listenToCompass();
    } catch (e) {
      setState(() {
        _isLocationError = true;
      });
    }
  }

  Future<void> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("خدمات الموقع غير مفعلة.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("تم رفض إذن الموقع.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("تم رفض إذن الموقع بشكل دائم.");
    }

    // الحصول على الموقع الحالي
    Position position = await Geolocator.getCurrentPosition();
    _calculateQiblaDirection(position.latitude, position.longitude);
  }

  void _calculateQiblaDirection(double latitude, double longitude) {
    const double kaabaLatitude = 21.4225;
    const double kaabaLongitude = 39.8262;

    double deltaLongitude = vector.radians(kaabaLongitude - longitude);
    double y = sin(deltaLongitude) * cos(vector.radians(kaabaLatitude));
    double x = cos(vector.radians(latitude)) *
        sin(vector.radians(kaabaLatitude)) -
        sin(vector.radians(latitude)) * cos(vector.radians(kaabaLatitude)) *
            cos(deltaLongitude);

    double qiblaDirection = vector.degrees(atan2(y, x));
    setState(() {
      _qiblaDirection = (qiblaDirection + 360) % 360;
    });
  }

  void _listenToCompass() {
    magnetometerEvents.listen((MagnetometerEvent event) {
      double heading = atan2(event.y, event.x) * (180 / pi);
      setState(() {
        _deviceHeading = (heading + 360) % 360;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double rotationAngle = (_qiblaDirection - _deviceHeading) % 360;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "القبلة",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: _isLocationError
          ? _buildErrorView()
          : _buildCompassView(rotationAngle),
    );
  }

  Widget _buildCompassView(double rotationAngle) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // الدائرة الخارجية للبوصلة
                Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [Colors.white, Color(0xFFF1C085)],
                      center: Alignment.center,
                      radius: 0.8,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),

                // النقاط الأساسية (الشمال، الجنوب، الشرق، الغرب)
                Positioned(top: 10, child: _buildDirectionText('N')),
                Positioned(bottom: 10, child: _buildDirectionText('S')),
                Positioned(right: 10, child: _buildDirectionText('E')),
                Positioned(left: 10, child: _buildDirectionText('W')),

                // سهم يشير للقبلة
                Transform.rotate(
                  angle: vector.radians(rotationAngle),
                  child: Icon(
                    FlutterIslamicIcons.solidQibla2,
                    size: 100,
                    color: Color(0xFFA85000),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'اتجاه القبلة: ${_qiblaDirection.toStringAsFixed(2)}°',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'اتجاه الجهاز: ${_deviceHeading.toStringAsFixed(2)}°',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, size: 80, color: Colors.red),
          SizedBox(height: 20),
          Text(
            'فشل في الوصول للموقع أو الحساسات.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _initializeCompass,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'إعادة المحاولة',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionText(String direction, {double fontSize = 20}) {
    return Text(
      direction,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Color(0xFFA85000),
      ),
    );
  }
}