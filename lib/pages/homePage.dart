import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_to_text/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SpeechToText speeechToText = SpeechToText();

  var text = "Hold the button and start speaking";
  var isLestening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isLestening,
        duration: Duration(milliseconds: 2000),
        glowColor: BgColor,
        repeatPauseDuration: Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isLestening) {
              var avaliable = await speeechToText.initialize();
              if (avaliable) {
                setState(() {
                  isLestening = true;
                  speeechToText.listen(onResult: (result) {
                    setState(() {
                      text = result.recognizedWords;
                    });
                  });
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isLestening = false;
            });
            speeechToText.stop();
          },
          child: CircleAvatar(
            backgroundColor: BgColor,
            radius: 35,
            child: Icon(
              isLestening ? Icons.mic : Icons.mic_none,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: Icon(
          Icons.sort_rounded,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: BgColor,
        elevation: 3,
        title: Text(
          "Voice to Text",
          style: GoogleFonts.getFont('Roboto',
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          margin: EdgeInsets.only(bottom: 150),
          child: Text(
            text,
            style: GoogleFonts.getFont('Roboto',
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54)),
          ),
        ),
      ),
    );
  }
}
