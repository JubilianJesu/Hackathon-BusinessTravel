import 'package:flutter/material.dart';
import '../Preferences/preference.dart';

class LoginPage extends StatefulWidget {
  static String tag = "loginPage";
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = new SnackBar(
      content: new Text('Logging In using Email: $_email'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);

    Navigator.of(context).pushNamed(MyPreferences.tag);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Validating forms'),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Form(
              key: formKey,
              child: new Column(
                children: [
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'Your email'),
                    validator: (val) =>
                    !val.contains('@') ? 'Not a valid email.' : null,
                    onSaved: (val) => _email = val,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(labelText: 'Your password'),
                    validator: (val) =>
                    val.length < 6 ? 'Password too short.' : null,
                    onSaved: (val) => _password = val,
                    obscureText: true,
                  ),
                  new RaisedButton(
                    onPressed: _submit,
                    child: new Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}