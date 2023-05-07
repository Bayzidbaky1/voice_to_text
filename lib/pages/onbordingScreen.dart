import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:voice_to_text/const.dart';
import 'homePage.dart';

class OnbordingScreen extends StatelessWidget {
  final box = GetStorage();
  final List<Introduction> list = [
    Introduction(
      title: 'Press the Mic',
      titleTextStyle:
          TextStyle(color: BgColor, fontWeight: FontWeight.bold, fontSize: 26),
      subTitle: 'Press and hold microphone button',
      imageUrl: 'assets/intro1.png',
    ),
    Introduction(
      title: 'Near on Microphone',
      titleTextStyle:
          TextStyle(color: BgColor, fontWeight: FontWeight.bold, fontSize: 26),
      subTitle:
          'Near your mouth to microphone and start talking what you want to conver  text',
      imageUrl: 'assets/intro2.png',
    ),
    Introduction(
      title: 'Convert voice to text',
      titleTextStyle:
          TextStyle(color: BgColor, fontWeight: FontWeight.bold, fontSize: 26),
      subTitle: 'converting the voice message to text',
      imageUrl: 'assets/intro3.png',
    ),
    Introduction(
      title: 'Finish',
      titleTextStyle:
          TextStyle(color: BgColor, fontWeight: FontWeight.bold, fontSize: 26),
      subTitle: 'Close microphone to stop recording & converting',
      imageUrl: 'assets/intro4.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroScreenOnboarding(
            backgroudColor: Colors.white,
            foregroundColor: BgColor,
            introductionList: list,
            skipTextStyle: TextStyle(
                fontWeight: FontWeight.bold, color: BgColor, fontSize: 24),
            onTapSkipButton: () {
              box.write("checked", true);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ), //MaterialPageRoute
              );
            }));
  }
}
