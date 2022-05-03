import 'package:dhanush/appconstants.dart';
import 'package:dhanush/providers/authnotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _passwordcontroller = TextEditingController();
  String _password;
  final scaffoldglobalkey = GlobalKey<ScaffoldState>();
  final formglobalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldglobalkey,
      appBar: AppBar(title: Text('Login'),),
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: formglobalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildpasswordtextformfield(),
                MaterialButton(
                  child: Text('Login'),
                  onPressed: () async {
                    if (!formglobalkey.currentState.validate()) {
                      return;
                    }
                    formglobalkey.currentState.save();

                    _passwordcontroller.clear();
                    if(_password == passwordexpected) {
                      var provider = Provider.of<AuthNotifier>(context,
                          listen: false);
                      provider.setLoggedinToTrue();
                    }
                    // User1 u = User1(password: _password);
                    // var provider = Provider.of<AuthNotifier>(context,
                    //     listen: false);
                    // await login(u, provider, toggle, showscaffoldmsg);

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildpasswordtextformfield() {
    return TextFormField(
      validator: (val) {
        return val.isEmpty ? 'Please Provide password' : null;
      },
      controller: _passwordcontroller,
      obscureText: true,
      onSaved: (value) {
        _password = value;
      },
    );
  }
}

