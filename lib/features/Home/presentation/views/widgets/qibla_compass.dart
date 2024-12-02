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

class _QiblaCompassState extends State<QiblaCompass>
    with SingleTickerProviderStateMixin {
  double _qiblaDirection = 0; // Qibla direction in degrees
  double _deviceHeading = 0; // Device heading in degrees
  bool _isLocationError = false; // Location error state
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _initializeCompass();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Initialize location and compass listeners
  Future<void> _initializeCompass() async {
    try {
      await _getCurrentPosition();
      _listenToCompass();
    } catch (e) {
      setState(() {
        _isLocationError = true;
      });
    }
  }

  // Get the current GPS position
  Future<void> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw Exception("Location services are disabled.");

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied.");
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    _calculateQiblaDirection(position.latitude, position.longitude);
  }

  // Calculate Qibla direction based on current latitude and longitude
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

  // Listen to the device's compass sensor
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
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        centerTitle: true,
      ),

      body: _isLocationError
          ? _buildErrorView()
          : _buildCompassView(rotationAngle),
    );
  }

  // Build the compass view
  Widget _buildCompassView(double rotationAngle) {
    // final directions = {
    //   'N': Alignment.topCenter,
    //   'S': Alignment.bottomCenter,
    //   'E': Alignment.centerRight,
    //   'W': Alignment.centerLeft,
    // };

    return Container(
      decoration: BoxDecoration(
          color:Colors.white,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Compass circle
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

                // Directions (N, S, E, W)
                // for (var entry in directions.entries)
                //   Align(
                //     alignment: entry.value,
                //     child: Text(
                //       entry.key,
                //       style: TextStyle(
                //         fontSize: 22,
                //         fontWeight: FontWeight.bold,
                //         color: Color(0xFFA85000),
                //       ),
                //     ),
                //   ),

                Positioned(
                  top: 10,
                  child: _buildDirectionText('N'),
                ),
                Positioned(
                  bottom: 10,
                  child: _buildDirectionText('S'),
                ),
                Positioned(
                  right: 10,
                  child: _buildDirectionText('E'),
                ),
                Positioned(
                  left: 10,
                  child: _buildDirectionText('W'),
                ),

                // Diagonal directions (NE, NW, SE, SW) for enhancement
                Positioned(
                  top: 40,
                  right: 40,
                  child: _buildDirectionText('NE', fontSize: 14),
                ),
                Positioned(
                  top: 40,
                  left: 40,
                  child: _buildDirectionText('NW', fontSize: 14),
                ),
                Positioned(
                  bottom: 40,
                  right: 40,
                  child: _buildDirectionText('SE', fontSize: 14),
                ),
                Positioned(
                  bottom: 40,
                  left: 40,
                  child: _buildDirectionText('SW', fontSize: 14),
                ),

                // Rotating Kaaba icon
                Transform.rotate(
                  angle: vector.radians(rotationAngle),
                  child: Icon(
                    FlutterIslamicIcons.solidQibla2,
                    size: 100,
                    color: Color(0xFFA85000),
                  ),
                ),

                // Heading indicator
                Transform.rotate(
                  angle: vector.radians(-_deviceHeading),
                  // child: Container(
                  //   width: 2,
                  //   height: 150,
                  //   color: Colors.red,
                  // ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Qibla: ${_qiblaDirection.toStringAsFixed(2)}°',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Heading: ${_deviceHeading.toStringAsFixed(2)}°',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Build the error view
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFA85000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _initializeCompass,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        direction,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Color(0xFFA85000),
        ),
      ),
    );
  }
}
