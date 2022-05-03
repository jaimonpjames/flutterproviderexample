import 'package:dhanush/appconstants.dart';
import 'package:dhanush/pages/homepage.dart';
import 'package:dhanush/pages/login.dart';
import 'package:dhanush/providers/authnotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
providers: [
  ChangeNotifierProvider(create: (_)=>AuthNotifier())
],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AuthNotifier>(context);
    return provider.loggedin ? HomePage():LoginPage();
  }
}



