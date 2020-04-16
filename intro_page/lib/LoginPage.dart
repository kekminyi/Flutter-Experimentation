import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username, _password;
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.grey;

  Padding buildTitle() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Login', style: TextStyle(fontSize: 42.0)));
  }

  Padding buildTitleLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 12.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 38.0,
            height: 1.5,
            color: Colors.blue.shade600,
          )),
    );
  }

  TextFormField buildUsername() {
    return TextFormField(
      onSaved: (usernameInput) => _username = usernameInput,
      validator: (usernameInput) {
        if (usernameInput.isEmpty) {
          return 'Please enter an username.';
        }
      },
      decoration: InputDecoration(labelText: 'Username'),
    );
  }

  TextFormField buildPassword(BuildContext context) {
    return TextFormField(
        obscureText: _isObscured,
        onSaved: (passwordInput) => _password = passwordInput,
        validator: (passwordInput) {
          if (passwordInput.isEmpty) {
            return 'Please enter a password.';
          }
        },
        decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              onPressed: () {
                if (_isObscured) {
                  setState(() {
                    _isObscured = false;
                    _eyeButtonColor = Theme.of(context).primaryColor;
                  });
                } else {
                  setState(() {
                    _isObscured = true;
                    _eyeButtonColor = Colors.grey;
                  });
                }
              },
              icon: Icon(Icons.remove_red_eye, color: _eyeButtonColor),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
          children: <Widget>[
            SizedBox(height: kToolbarHeight),
            buildTitle(),
            buildTitleLine(),
            SizedBox(height: 70),
            buildUsername(),
            buildPassword(context),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?'),
              ),
            )
          ]),
    ));
  }
}
