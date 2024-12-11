import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_container/easy_container.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_audio/surahAudio_cubit.dart';
import 'package:quran_app/features/quran/presentation/controller/surah_audio/surahAudio_state.dart';

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
      backgroundColor: const Color(0xFFF5F5DC), // خلفية هادئة مشابهة للمصحف
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF522700), // لون بني داكن للمصحف
        title: Center(
          child: Text(
            widget.name,
            style: const TextStyle(fontFamily: "Taha", fontSize: 20, color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context), // الرجوع إلى الصفحة السابقة
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // إعدادات إضافية
            },
          ),
        ],
      ),
      body: BlocBuilder<SurahaudioCubit, SurahAudioState>(
        builder: (context, state) {
          if (state is SurahAudioInital) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            );
          } else if (state is SurahAudioSuccess) {
            final ayahs = state.surahListAudio?.ayahs;

            if (ayahs == null || ayahs.isEmpty) {
              return const Center(child: Text('لا توجد آيات متاحة'));
            }

            // تقسيم الآيات حسب الصفحات
            Map<int, List<dynamic>> ayahsByPage = {};
            for (var ayah in ayahs) {
              int page = ayah.page!;
              ayahsByPage.putIfAbsent(page, () => []).add(ayah);
            }

            // ترتيب الآيات حسب الصفحات
            List<List<dynamic>> pages = ayahsByPage.values.toList();

            return PageView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (pageIndex) {
                setState(() {
                  index = pageIndex;
                });
              },
              controller: _pageController,
              itemCount: pages.length,
              itemBuilder: (context, pageIndex) {
                return SafeArea(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Column(
                      children: [
                        EasyContainer(
                          borderRadius: 12,
                          color: const Color(0xFFA85000).withOpacity(0.3), // لون خلفية خفيف
                          showBorder: true,
                          padding: 8,
                          child: Text(
                            "صفحة ${pageIndex + 1} من ${pages.length}",
                            style: const TextStyle(
                              fontFamily: 'aldahabi', // خط يشبه الخط المستخدم في المصحف
                              fontSize: 16,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: pages[pageIndex].map((ayah) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    "${ayah.text} (${ayah.numberInSurah})",
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      height: 1.8,
                                      color: Colors.black87,
                                      fontFamily: "QCF_P001", // خط مشابه للقرآن
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }).toList(),
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
      drawerEnableOpenDragGesture: false, // تعطيل السحب للدرج
    );
  }
}

