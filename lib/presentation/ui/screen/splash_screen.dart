import 'package:crud_app/presentation/ui/screen/home_screen.dart';
import 'package:crud_app/presentation/widget/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToHome();
  }

  Future<void> _moveToHome() async {
    await Future.delayed(const Duration(seconds: 5));

    if (mounted) {
      Get.off(()=>const HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Version : 0.0.1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
