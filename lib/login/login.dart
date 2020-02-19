import 'package:flutter/material.dart';
import '../Preferences/preference.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/authlogin.dart';

class LoginPage extends StatefulWidget {
  static String tag = "loginPage";
  @override
  _LoginPageState createState() => new _LoginPageState();
}

const MaterialColor blueDeep = const MaterialColor(
    _bluePrimaryValue,
    const <int, Color>{
       50: const Color(0xFFE3F2FD),
      100: const Color(0xFFBBDEFB),
      200: const Color(0xFF90CAF9),
      300: const Color(0xFF64B5F6),
      400: const Color(0xFF42A5F5),
      500: const Color(_bluePrimaryValue),
      600: const Color(0xFF1E88E5),
      700: const Color(0xFF1976D2),
      800: const Color(0xFF1565C0),
      900: const Color(0xFF0D47A1),
    },
  );
const int _bluePrimaryValue = 0xFF0D47A1;

class loginProfile {
  final String authToken;
  final String profileId;
  final String companyId;
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;

  Future<String> _loginuser() async {
    dynamic input = "{" "Username" ":" "$_email" "}";
    print(input);

    http.Response res = await http.post(
        "https://ndcwas18.azurewebsites.net/api/login",
        body: input,
        headers: {"Content-Type": "Application/Json"});
    // print(res.body);
    // print(res.statusCode);
    return res.body;
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      print(_loginuser().toString());
      var profiledata;

      const JsonCodec JSON = json;

      _loginuser().then((res) {
        profiledata = JSON.decode(res.toString());
      });
      // var profiledata = JSON.decode(_loginuser().toString());

      print(profiledata);
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
        title: new Text('Corporate Travel Market Place'),
      ),
      body: new Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/HubBG-1.png"),
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
                  decoration: new InputDecoration(labelText: 'Your email',labelStyle: new TextStyle(color: Colors.white)),
                  validator: (val) =>
                      !val.contains('@') ? 'Not a valid email.' : null,
                  onSaved: (val) => _email = val,
                  style: new TextStyle(color: Colors.white),
                  initialValue: 'jubilian.j@tcs.com',
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Your password', labelStyle: new TextStyle(color: Colors.white),
                    ),
                  validator: (val) =>
                      val.length < 6 ? 'Password too short.' : null,
                  onSaved: (val) => _password = val,
                  obscureText: true,
                  style: new TextStyle(color: Colors.white),
                  initialValue: 'Test123',
                ),
                new Container(
                  width: 1200.00,
                  height: 50.00,
                  margin:
                      const EdgeInsets.only(left: 50.0, top: 50.0, right: 50.0),
                  child: new RaisedButton(
                    onPressed: _submit,
                    child: new Text('Login',style: new TextStyle(color: Colors.white,fontSize: 20.00)),
                    color: Colors.deepPurple,
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
