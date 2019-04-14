import 'package:flutter/material.dart';
import 'package:kario_kelias/authentication/authentication_manager.dart';
import 'package:kario_kelias/components/login/user_login_component.dart';
import 'package:kario_kelias/components/quiz/quiz_component.dart';
import 'package:kario_kelias/components/results/results_component.dart';
import 'package:kario_kelias/widget/full_width_button.dart';

class HomeComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Kario kelias"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: FractionallySizedBox(
              widthFactor: 0.6,
              child: Image.asset("assets/logo.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FullWidthButton(
                  text: "Žaisti",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizComponent()),
                    );
                  },
                ),
                FullWidthButton(
                  text: "Rezultatai",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsComponent()),
                    );
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Center(
                child: RaisedButton(
                  child: Text("Atsijungti"),
                  onPressed: () async {
                    await AuthenticationManager().logout();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserLoginComponent()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
