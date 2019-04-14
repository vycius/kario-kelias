import 'package:flutter/material.dart';
import 'package:kario_kelias/components/quiz/quiz_component.dart';
import 'package:kario_kelias/questions.dart';
import 'package:kario_kelias/widget/full_width_button.dart';
import 'package:url_launcher/url_launcher.dart';

class WonComponent extends StatelessWidget {
  final Game game;

  const WonComponent({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "Dar viena pergalė!\nTu jau ${game.userInfo.nextRank}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              FullWidthButton(
                text: "Kylam toliau!",
                fontSize: 24,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => QuizComponent()),
                  );
                },
              ),
              FullWidthButton(
                text: "Pasiilsim",
                fontSize: 24,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  bottom: 8,
                  right: 8,
                  left: 8,
                ),
                child: Center(
                  child: Text(
                    "Kario kelias veža!\nNori išbandyti?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              FullWidthButton(
                text: "Sužinoti daugiau",
                fontSize: 24,
                onPressed: () async {
                  const url = 'https://www.karys.lt/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
