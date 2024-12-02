import 'package:flutter/material.dart';
import 'package:quran_app/features/authentication/presentation/views/screens/signUp_page.dart';
import 'package:quran_app/features/authentication/presentation/views/widgets/shader_mask_text.dart';
import '../screens/login_page.dart';

class TabBarSignLogin extends StatefulWidget {
  const TabBarSignLogin({super.key});

  @override
  State<TabBarSignLogin> createState() => _TabBarSignLoginState();
}

class _TabBarSignLoginState extends State<TabBarSignLogin> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSelectText=false;

  final Color backgroundColor = const Color(0xFFFFFFFF);
  final Color tabBarColor = const Color(0xffEDEEEF);
  final Color tabIndicatorColor = const Color(0xFFFFFFFF);
  final Color selectedLabelColor =  const Color(0xFFA85000);
  final Color unselectedLabelColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this,initialIndex: 1);// intial بتشفولي انا واقفه علي مين
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Center(
                    child: ShaderMaskText(
                      text: 'أولي العزم',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      gradient: LinearGradient(
                        colors: [ Color(0xFF7A4C26),Color(0xFFE6A366)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'قم بتسجيل الدخول أو إنشاء حساب جديد لحفظ تقدمك',
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ' لحفظ تقدمك',
                    style: TextStyle(
                      color: Color(0xFF777777),
                      fontSize: 15,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: tabBarColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBar(
                            controller: _tabController,
                            labelColor: selectedLabelColor,
                            unselectedLabelColor: unselectedLabelColor,
                            dividerHeight: 0, // بتحذفلي الخط
                            indicator: BoxDecoration(
                              color: tabIndicatorColor,
                              borderRadius: BorderRadius.circular(10),

                              shape: BoxShape.rectangle,
                            ),

                            labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal,color: Colors.black),
                            indicatorPadding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(text: "انشاء حساب"),
                              Tab(text: "تسجيل الدخول"),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            SignupPage(),
            LoginPage(),

          ],
        ),
      ),

    );
  }
}
