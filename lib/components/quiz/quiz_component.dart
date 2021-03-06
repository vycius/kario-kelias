import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kario_kelias/api/api_service.dart';
import 'package:kario_kelias/components/quiz/lost_component.dart';
import 'package:kario_kelias/components/quiz/won_component.dart';
import 'package:kario_kelias/questions.dart';
import 'package:kario_kelias/widget/full_width_button.dart';

class QuizComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Game>(
          future: ApiService().startGame(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GameComponent(game: snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class GameComponent extends StatefulWidget {
  final Game game;

  const GameComponent({Key key, this.game}) : super(key: key);

  @override
  _GameComponentState createState() => _GameComponentState(this.game);
}

class _GameComponentState extends State<GameComponent> {
  final Game game;

  _GameComponentState(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Column(
            children: [
              QuestionComponent(
                  question: game.getCurrentQuestion(), game: game),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      ),
    );
  }

  void lostGame(Answer answer) {
    ApiService().submitGame(
      game,
      finished: true,
      failedAnswer: answer,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LostComponent(
                game: game,
              )),
    );
  }

  void nextQuestion() {
    if (game.isLastQuestion()) {
      game.nextQuestion();
      ApiService().submitGame(game, finished: true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => WonComponent(
                  game: game,
                )),
      );
      // Game finished
    } else {
      setState(() {
        game.nextQuestion();
        ApiService().submitGame(game, finished: false);
      });
    }
  }
}

class AnswerComponent extends StatelessWidget {
  final Answer answer;

  const AnswerComponent({Key key, @required this.answer})
      : assert(answer != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullWidthButton(
      text: answer.text,
      fontSize: 21,
      onPressed: () {
        print("Answer ${answer.text}");

        final _GameComponentState navigator = context
            .ancestorStateOfType(const TypeMatcher<_GameComponentState>());

        assert(() {
          if (navigator == null) {
            throw new FlutterError(
                'AnswerComponent operation requested with a context that does '
                'not include a _GameComponentState.');
          }
          return true;
        }());

        if (answer.isCorrect) {
          navigator.nextQuestion();
        } else {
          navigator.lostGame(answer);
        }
      },
    );
  }
}

class QuestionComponent extends StatelessWidget {
  final Question question;
  final Game game;

  const QuestionComponent({Key key, @required this.question, this.game})
      : assert(question != null),
        assert(game != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var answers = question.answers
        .map((ans) => AnswerComponent(
              answer: ans,
            ))
        .toList();

    var answersColumn = Column(
      children: answers,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: WidthButton(
                        text:
                            "${game.answeredQuestions.length + 1}/${game.questions.length}",
                        fontSize: 14,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CountdownTimerComponent(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
                child: FullWidthButton(
                  text: question.text,
                  fontSize: 24,
                  onPressed: () {},
                ),
              ),
              answersColumn,
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}

class CountdownTimerComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountdownTimerComponentState();
  }
}

class CountdownTimerComponentState extends State<CountdownTimerComponent> {
  final startedTime = DateTime.now();
  final maximumTimeSecs = 120;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(microseconds: 100), (i) => i),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        DateFormat format = DateFormat("mm:ss");
        int now = DateTime.now().millisecondsSinceEpoch;
        var diff = max(
            startedTime.millisecondsSinceEpoch + maximumTimeSecs * 1000 - now,
            0);

        Duration remaining = Duration(milliseconds: diff);
        var dateString =
            '${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';

        return WidthButton(
          text: dateString,
          fontSize: 14,
          onPressed: () {},
        );
      },
    );
  }
}
