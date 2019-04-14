import 'package:flutter/material.dart';
import 'package:kario_kelias/components/quiz/quiz_component.dart';
import 'package:kario_kelias/questions.dart';
import 'package:kario_kelias/widget/full_width_button.dart';

class LostComponent extends StatelessWidget {
  final Game game;

  const LostComponent({Key key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Pralaimėjai"),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Center(child: Text("Puolimas nepaėjo. Nusvilai.")),
              Center(child: Text(game.getCurrentQuestion().explanation)),
              FullWidthButton(
                text: "Pabandom dar kartą?",
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
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
