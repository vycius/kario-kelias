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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Puolimas nepaėjo! \nNusvilai",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
                  child: FullWidthButton(
                    text: game.getCurrentQuestion().explanation,
                    onPressed: () {},
                    fontSize: 20,
                  ),
                ),
                FullWidthButton(
                  text: "Pabandom dar kartą?",
                  fontSize: 24,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuizComponent()),
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
          ),
        ),
      ),
    );
  }
}
