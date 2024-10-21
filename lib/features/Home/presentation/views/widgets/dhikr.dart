import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';

class Dhikr extends StatefulWidget {
  final String data;
  const Dhikr({super.key, required this.data});

  @override
  State<Dhikr> createState() => _DhikrState();
}

class _DhikrState extends State<Dhikr> {
  int _counter = 0;

  // زيادة العداد
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // إعادة تعيين العداد
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Dhikr",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),), // عنوان شريط التطبيق
        backgroundColor: Color(0xFF0F207C), // لون خلفية شريط التطبيق
        centerTitle: true, // لوضع العنوان في المنتصف
        iconTheme: IconThemeData(
          size: 30,
          color: Colors.white,
        ),
        actions:[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              FlutterIslamicIcons.tasbih2,
              size: 50,
              textDirection: TextDirection.rtl,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
        ]
      ),
      backgroundColor: const Color(0xFF0F227C),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                widget.data,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white, // لون النص للزيادة في التباين
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Container(
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blueAccent[700], // لون أغمق ليتناسب مع الخلفية
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 5),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text(
                      "$_counter",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        color: Colors.black, // لون النص داخل العداد
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                width: 170,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.blueAccent[700], // لون أغمق
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _incrementCounter();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        minimumSize: const Size(80, 80), // Adjusted size
                        backgroundColor: Colors.white, // لون خلفية الزر
                      ),
                      child: Container(

                        child: Text(
                          "Tap",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _resetCounter();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            minimumSize: const Size(
                                30, 30), // Adjusted size to avoid constraints issue
                            backgroundColor: Colors.white, // لون خلفية الزر
                          ),
                          child: Container(
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                  fontSize: 5, color: Colors.redAccent),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
