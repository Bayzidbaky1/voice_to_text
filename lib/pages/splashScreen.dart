import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_to_text/const.dart';
import 'package:voice_to_text/pages/homePage.dart';
import 'package:voice_to_text/pages/onbordingScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  anotherScreen() {
    var value = box.read("checked");
    print(value);

    if (value == true) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => OnbordingScreen()));
    }
  }

  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 5),
        () => anotherScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/intro3.png",
              width: 300,
            ),
            Text("Voice to Text",
                style: GoogleFonts.getFont(
                  "Roboto",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: BgColor,
                      fontSize: 24),
                )),
          ],
        ),
      ),
    );
  }
}
