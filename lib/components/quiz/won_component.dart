import 'package:flutter/material.dart';
import 'package:kario_kelias/questions.dart';

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
              Center(child: Text("Dar viena pergalė.\nTu jau “rangas”")),
              Center(
                child: MaterialButton(
                  child: Text("Kylam toliau!"),
                  onPressed: () {},
                ),
              ),
              Center(
                child: MaterialButton(
                  child: Text("Pasiilsim"),
                  onPressed: () {},
                ),
              ),
              Center(
                child: Text("Kario kelias veža? Nori išbandyti?"),
              ),
              Center(
                child: MaterialButton(
                  child: Text("Sužinoti daugiau"),
                  onPressed: () {

                  },
                ),
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
