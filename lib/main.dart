import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'components/resume_page.dart';
import 'components/question_page.dart';
import 'components/contact_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyTabController(),
    );
  }
}

class MyTabController extends StatelessWidget {
  final List<Tab> myTabs = [
    Tab(icon: Icon(Icons.person)),
    Tab(icon: Icon(Icons.subject)),
    Tab(icon: Icon(Icons.help)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  // The number of tabs / content sections to display
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
          ),
          title: Text('Call Me Maybe?'),
        ),
        body: TabBarView(children: [
          // ContactPage(),
          ContactPage(),
          ResumePage(),
          QuestionPage(),
        ],
        ),
      ),
    );
  }
}