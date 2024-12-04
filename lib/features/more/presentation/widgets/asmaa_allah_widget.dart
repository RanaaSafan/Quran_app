import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/functions/api_service.dart';
import 'package:quran_app/features/more/data/repo/repo_asmaahusna_impl.dart';
import 'package:quran_app/features/more/presentation/controller/asmaa_allah_cubit.dart';
import '../controller/asmaa_allah_state.dart';

class AsmaaAllahWidget extends StatefulWidget {
  const AsmaaAllahWidget({super.key});

  @override
  State<AsmaaAllahWidget> createState() => _AsmaaAllahWidgetState();
}

class _AsmaaAllahWidgetState extends State<AsmaaAllahWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch Asma Ul Husna data when the widget is created
    context.read<AsmaaAllahCubit>().getAsmaa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "اسماء الله الحسني",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5, // المسافة بين الحروف
          ),
        ),
        backgroundColor: const Color(0xFF3E1F00), // لون داكن
        centerTitle: true,
        elevation: 10,
      ),
      body: BlocBuilder<AsmaaAllahCubit, AsmaaAllahState>(
        builder: (context, state) {
          if (state is AsmaaAllahLoading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            );
          } else if (state is AsmaaAllahSuccess) {
            final names = state.Asmaulhusna
                .map((asmaa) => asmaa.arab) // Extract names
                .join(' '); // Join names with space

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade100, Colors.orange.shade300], // تدرج برتقالي جميل
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30), // حواف دائرية
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5), // تأثير ظل ناعم
                        blurRadius: 20,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Wrap(
                    spacing: 15, // المسافة بين الكلمات
                    runSpacing: 10, // المسافة بين الأسطر
                    children: [
                      Text(
                        names, // عرض الأسماء
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold, // سمك خط متوسط
                          fontFamily: 'GoogleSans',
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(2, 2),
                              blurRadius: 5,
                            ),
                          ], // إضافة تأثير ظل
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is AsmaaAllahFailure) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 50),
                    SizedBox(height: 10),
                    Text(
                      'Error: ${state.error}',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
