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
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Laimėjai"),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Center(
                  child: Text(
                      "Dar viena pergalė.\nTu jau ${game.userInfo.nextRank}")),
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
              Center(
                child: Text("Kario kelias veža? Nori išbandyti?"),
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
        ],
      ),
    );
  }
}
