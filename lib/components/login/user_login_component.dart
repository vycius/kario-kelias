import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/flutter_firebase_ui.dart';
import 'package:flutter_firebase_ui/login_view.dart';
import 'package:kario_kelias/authentication/authentication_manager.dart';
import 'package:kario_kelias/components/home/home_component.dart';

class UserLoginFullscreenComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prisijunkite"),
      ),
      body: UserLoginComponent(),
    );
  }
}

class UserLoginComponent extends StatefulWidget {
  @override
  _UserLoginComponentState createState() => new _UserLoginComponentState();
}

class _UserLoginComponentState extends State<UserLoginComponent> {
  final _authenticationManager = AuthenticationManager();

  StreamSubscription<FirebaseUser> _listener;

  FirebaseUser _currentUser;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  @override
  void dispose() {
    _listener.cancel();
    _listener = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: FractionallySizedBox(
                widthFactor: 0.4,
                child: Image.asset("assets/logo.png"),
              ),
            ),
            new Expanded(
              child: new LoginView(
                providers: [
                  ProvidersTypes.google,
                ],
                passwordCheck: false,
              ),
            ),
          ],
        ));
  }

  void _checkCurrentUser() async {
    _currentUser = await _authenticationManager.getCurrentUser();
    setState(() {});

    _listener = _authenticationManager.listenForUser((FirebaseUser user) {
      if (_listener != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeComponent()),
        );
      }
    }, onError: (ex) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(ex.toString()),
        ),
      );
    });
  }
}