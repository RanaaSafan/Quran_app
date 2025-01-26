import 'package:flutter/material.dart';
import 'package:quran_app/features/Home/presentation/views/widgets/tasbeeh_conatiner_dhikr.dart';

class ListTasbeehContainerCategories extends StatefulWidget {
  ListTasbeehContainerCategories({super.key});

  @override
  State<ListTasbeehContainerCategories> createState() => _ListTasbeehContainerCategoriesState();
}

class _ListTasbeehContainerCategoriesState extends State<ListTasbeehContainerCategories> {
  List<String> Data = [
    "أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ،لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ\n، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير",
    "رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.",
    "حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.",
    "بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم.",
    "بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ \nوَهـوَ السّمـيعُ العَلـيم.",
    "اللّهُـمَّ بِكَ أَمْسَـينا وَبِكَ أَصْـبَحْنا، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ الْمَصِيرُ.",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ",
    "سُبْحَانَ اللَّهِ ، وَالْحَمْدُ لِلَّهِ ، وَلا إِلَهَ إِلا اللَّهُ ، وَاللَّهُ أَكْبَرُ ، اللَّهُمَّ اغْفِرْ لِي ،\n اللَّهُمَّ ارْحَمْنِي ، اللَّهُمَّ ارْزُقْنِي.",
    "رَبَّنَا لاَ تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِن لَّدُنكَ رَحْمَةً إِنَّكَ أَنتَ الْوَهَّابُ. [آل عمران - 8].",
  "ربَّنَا اغْفِرْ لَنَا ذُنُوبَنَا وَإِسْرَافَنَا فِي أَمْرِنَا وَثَبِّتْ أَقْدَامَنَا وانصُرْنَا عَلَى الْقَوْمِ الْكَافِر. [آل عمران - 147].",


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("اذكار",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),), // عنوان شريط التطبيق
        backgroundColor: Color(0xFFd84315).withOpacity(0.9),
        centerTitle: true,
        iconTheme: IconThemeData(
            size: 30,
                color: Colors.white,
        ),
      ),
      body: Container(
        //color: Color(0xFF0F227C), // Set the background color here
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: Data.length, // Number of prayer types
          itemBuilder: (BuildContext context, int index) {
            return TasbeehConatinerDhikr(data: Data[index]);
          },
        ),
      ),
    );
  }
}
