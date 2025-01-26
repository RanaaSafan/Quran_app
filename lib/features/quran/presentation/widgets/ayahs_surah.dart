import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_audio/surahAudio_cubit.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_audio/surahAudio_state.dart';
import 'package:easy_container/easy_container.dart';

class AyahsSurah extends StatefulWidget {
  final int number;
  final String name;

  const AyahsSurah({Key? key, required this.number, required this.name}) : super(key: key);

  @override
  State<AyahsSurah> createState() => _AyahsSurahState();
}

class _AyahsSurahState extends State<AyahsSurah> {
  late PageController _pageController;
  int index = 0;
  String? highlightVerse; // متغير لتخزين الآية المميزة

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: index);
    context.read<SurahaudioCubit>().getSurahAudio(widget.number, widget.name);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      body: BlocBuilder<SurahaudioCubit, SurahAudioState>(
        builder: (context, state) {
          if (state is SurahAudioInital) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SurahAudioSuccess) {
            final ayahs = state.surahListAudio?.ayahs;

            if (ayahs == null || ayahs.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            // تحديد الآيات حسب الصفحات
            Map<int, List<dynamic>> ayahsByPage = {};
            for (var ayah in ayahs) {
              int page = ayah.page!;
              ayahsByPage.putIfAbsent(page, () => []).add(ayah);
            }

            List<List<dynamic>> pages = ayahsByPage.values.toList();

            return PageView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, pageIndex) {
                return SafeArea(
                  child: Container(
                    color: const Color(0xFFFFFFFF),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back_ios, size: 24),
                                onPressed: () => Navigator.pop(context),
                              ),
                              Text(
                                widget.name,
                                style: const TextStyle(fontFamily: "Taha", fontSize: 14),
                              ),
                              EasyContainer(
                                borderRadius: 12,
                                color: Colors.orange.withOpacity(.5),
                                showBorder: true,
                                height: 20,
                                width: 120,
                                padding: 0,
                                margin: 0,
                                child: Center(
                                  child: Text(
                                    "صفحة ${pageIndex + 1}",
                                    style: const TextStyle(
                                      fontFamily: 'aldahabi',
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: Directionality(
                                textDirection: TextDirection.rtl, // عرض النصوص من اليمين لليسار مثل المصحف
                                child: Wrap(
                                  alignment: WrapAlignment.start, // محاذاة العناصر
                                  runSpacing: 6.0, // المسافة بين الأسطر
                                  spacing: 0.0, // المسافة بين الكلمات
                                  children: pages[pageIndex].map<Widget>((ayah) {
                                    bool isHighlighted = highlightVerse == "${ayah.numberInSurah}";

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 5.0), // مسافة بين الآيات
                                      child: Center(
                                        child: Text.rich(
                                          softWrap: true,
                                          locale: const Locale("ar"),
                                          TextSpan(
                                            text: ayah.text, // نص الآية
                                            style: TextStyle(
                                              color: isHighlighted ? Colors.red : Colors.black87,
                                              letterSpacing: 0.0,
                                              wordSpacing: 0.0,
                                              fontFamily: "QCF_P${index.toString().padLeft(3, "0")}",
                                              fontSize:  28.0 ,
                                            ),
                                            children: [
                                              WidgetSpan(
                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 0.0), // مسافة بين النص ورقم الآية
                                                  padding: const EdgeInsets.only(left: 7.0,right: 7,top: 7),
                                                  decoration: BoxDecoration(

                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFFA85000),
                                                      Color(0xFFA85600),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),

                                                  ),
                                                  child: Text(
                                                    "${ayah.numberInSurah}",
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontFamily: "QCF_P001",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is SurahAudioFailer) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      'خطأ: ${state.errmsg}',
                      style: const TextStyle(
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

          return const Center(child: Text('لا توجد بيانات متاحة'));
        },
      ),
      drawerEnableOpenDragGesture: false,
    );
  }
}
