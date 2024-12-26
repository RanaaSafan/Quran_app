import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
class ResponseLogin extends StatefulWidget {
  const ResponseLogin({super.key});

  @override
  State<ResponseLogin> createState() => _ResponseLoginState();

}

class _ResponseLoginState extends State<ResponseLogin> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }
  void _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    GoRouter.of(context).push(Routers.MainScreen.name);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/Frame 43.png',width: 400,height: 400,fit: BoxFit.cover,),
        Text("تم ارسال طلبك",style: TextStyle(color: Color(0xFFA85000),fontSize: 24,fontWeight: FontWeight.w600,decoration: TextDecoration.none,),),
        SizedBox(height: 15,),
        Text("يرجى الانتظار....",style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500,decoration: TextDecoration.none,),),
        SizedBox(height: 5,),
        Text("سيقوم المسؤولون بتسكينك مع أحد المحفظين",style: TextStyle(color: Color(0xFF000000),fontSize: 16,fontWeight: FontWeight.w500,decoration: TextDecoration.none,),),
      ],
    );
  }
}
