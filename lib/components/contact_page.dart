import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildColumn(context);
  }

  Widget buildColumn(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.portrait) {
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
      gitAndEmail()  
    ],);
    } else {
    return landScapeView();
    }
  }

  Row landScapeView() {
    return Row (
      children: [
        paddedImage(),
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Granit Arifi', style: TextStyle(fontSize: 30)),
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
        gitAndEmail(),
        ])  
      ],);
  }

  Row gitAndEmail() {
    return Row ( 
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
    ]);
  }

  Widget paddedImage() {
    return Align(
      alignment: Alignment.center,   
      child: Padding(
        padding: EdgeInsets.fromLTRB(40,25,40,20),
        child:
        ClipOval(
          child: Image.asset('assets/images/profile_pic.jpg', width: 125, height: 125, fit:BoxFit.cover),
        ),
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