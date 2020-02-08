import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components/resume_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
          Icon(Icons.help),
        ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext build) {
    return Column (
      children: [
        paddedImage(),
        Text('Granit Arifi', style: TextStyle(fontSize: 30)),
        Padding(padding: EdgeInsets.all(10), child: Text('Software Developer', style: TextStyle(fontSize: 20))),
        FlatButton(
          onPressed: () => _sendSms('1234568910'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.textsms),
              Text('123 456 7890', style: TextStyle(fontSize: 15))
            ],
          ),
        ),
        Row ( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Align (
          alignment: Alignment.centerLeft,
          child: Padding(padding: EdgeInsets.fromLTRB(0,0,0,0), 
                        child: RaisedButton( 
                              onPressed: () => _launchURL('https://github.com/Granit23'),
                              child: Row(
                              children: [
                              Icon(Icons.open_in_browser),
                              Text(
                               'github.com/Granit23', 
                               style: TextStyle(fontSize: 13),
                               ),
                              ],
                              ),
                            )
                        ),
          ),
        Align (
          alignment: Alignment.centerLeft,
          child: Padding(padding: EdgeInsets.fromLTRB(10,0,0,0), 
                        child: RaisedButton( 
                              onPressed: () => _sendEmail('arifig@oregonstate.edu'),
                              child: Row(
                              children: [
                              Icon(Icons.email),
                              Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text(
                               'arifig@oregonstate.edu', 
                               style: TextStyle(fontSize: 13),

                               ),
                              )
                              ],
                              ),
                            )
                        ),
          ),
        ])  
        // Align(alignment: Alignment.topCenter, child: Placeholder()),
    ],);
  }

  Widget paddedImage() {
    return Align(
      alignment: Alignment.bottomCenter,   
      child: Padding(
        padding: EdgeInsets.fromLTRB(40,25,40,20),
        child:
        ClipOval(
          child: Image.asset('assets/images/profile_pic.jpg', width: 125, height: 125, fit:BoxFit.cover),
        ),
          // child: ClipRRect(
          //   borderRadius: BorderRadius.circular(12.0),
          //   // child: Image.asset('assets/images/profile_pic.jpg', width: 125, height: 125),
          // ),
          // )
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  
  _sendEmail(String email) => launch('mailto:$email');
  _sendSms(String number) => launch('sms:$number');
  

}







// DefaultTabController(
//   // The number of tabs / content sections to display
//   length: 3,
//   child: Scaffold(
//     appBar: AppBar(
//       bottom: TabBar(
//         tabs: [
//           Tab(icon: Icon(Icons.person)),
//           Tab(icon: Icon(Icons.subject)),
//           Tab(icon: Icon(Icons.help)),
//         ],
//       ),
//     ),
//   ),
// );

// class MyTabbedPage extends StatefulWidget {
//   const MyTabbedPage({ Key key }) : super(key: key);
//   @override
//   _MyTabbedPageState createState() => _MyTabbedPageState();
// }

// class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
//   final List<Tab> myTabs = <Tab>[
//     Tab(icon: Icon(Icons.person)),
//     Tab(icon: Icon(Icons.subject)),
//     Tab(icon: Icon(Icons.help)),
//   ];

//   TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(vsync: this, length: myTabs.length);
//   }

//  @override
//  void dispose() {
//    _tabController.dispose();
//    super.dispose();
//  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: myTabs,
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children:,
//       ),
//     );
//   }
// }

