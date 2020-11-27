import 'dart:ui';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workshop0/utlis/my_colors.dart';

bool isSwitchOn = false;

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: MainDetails(),
      )),
    );
  }
}

class MainDetails extends StatefulWidget {
  @override
  _MainDetailsState createState() => _MainDetailsState();
}

class _MainDetailsState extends State<MainDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeaderWidget(),
        SizedBox(
          height: 12.0,
        ),
        BodyWidget(),
        Expanded(
          child: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  leading: Icon(FeatherIcons.checkCircle),
                  title: Text('Profile header widget'),
                ),
                ListTile(
                  leading: Icon(FeatherIcons.checkCircle),
                  title: Text('Material card widget'),
                ),
                ListTile(
                  leading: Icon(FeatherIcons.checkCircle),
                  title: Text('Details page'),
                ),
                ListTile(
                  leading: Icon(FeatherIcons.checkCircle),
                  title: Text('Flat buttons'),
                ),
                ListTile(
                  leading: Icon(FeatherIcons.checkCircle),
                  title: Text('Rows & columns'),
                ),
                ListTile(
                  leading: Icon(FeatherIcons.checkCircle),
                  title: Text('Scrollable lists'),
                ),
                ListTile(
                  leading: Icon(FeatherIcons.checkCircle),
                  title: Text('Switch buttons'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            icon: Icon(
              FeatherIcons.arrowLeft,
              color: MyColors.mBlack,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        SizedBox(
          width: 12.0,
        ),
        Text(
          "TITLE",
          style: TextStyle(
              color: MyColors.mBlack,
              fontWeight: FontWeight.w300,
              fontSize: 20.0),
        ),
        Spacer(),
        Switch(
          value: isSwitchOn,
          onChanged: (value) {
            setState(() {
              if (!isSwitchOn) {
                Flushbar(
                  title: "DSC ESPRIT",
                  message: "reminder is set to ON",
                  duration: Duration(milliseconds: 5000),
                  margin: EdgeInsets.all(8.0),
                  borderRadius: 8,
                )..show(context);
              } else {
                Flushbar(
                  title: "DSC ESPRIT",
                  message: "reminder is set to OFF",
                  duration: Duration(milliseconds: 5000),
                  margin: EdgeInsets.all(8.0),
                  borderRadius: 8,
                )..show(context);
              }

              isSwitchOn = value;
            });
          },
          activeTrackColor: Colors.green[300],
          activeColor: MyColors.mGreen,
        ),
      ],
    );
  }
}

class BodyWidget extends StatefulWidget {
  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  Future<void> _openGitRepo() async {
    const url = "https://github.com/DSC-ESPRIT-MOBILE/dsc-flutter-workshop-00";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "url launch failed";
    }
  }

  Future<void> _openGoogleMeet() async {
    const url = "https://meet.google.com/sth-kcrz-vhn⁩";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "url launch failed";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/cover.jpg',
          fit: BoxFit.fill,
          height: 200.0,
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: FlatButton.icon(
              onPressed: _openGitRepo,
              icon: Icon(
                FeatherIcons.github,
                color: MyColors.mBlack,
              ),
              label: Text("CLONE OR DOWNLOAD CODE"),
            ))
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              FeatherIcons.radio,
              color: MyColors.mRed,
            ),
            SizedBox(
              width: 6.0,
            ),
            Text(
              "Session is currently LIVE",
              style: TextStyle(color: MyColors.mBlack),
            ),
            Spacer(),
            FlatButton.icon(
                splashColor: Colors.greenAccent[100],
                onPressed: _openGoogleMeet,
                icon: Icon(
                  FeatherIcons.video,
                  color: MyColors.mGreen,
                ),
                label: Text("JOIN MEET"))
          ],
        ),
        SizedBox(
          height: 36.0,
        ),
        Row(
          children: [
            Text(
              "Details page outcomes",
              style:
                  TextStyle(color: MyColors.mBlue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        SizedBox(
          height: 12.0,
        ),
      ],
    );
  }
}
