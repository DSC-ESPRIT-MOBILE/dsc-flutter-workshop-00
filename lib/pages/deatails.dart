import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
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
        BodyWidget()
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
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
                child: OutlineButton(
              borderSide: BorderSide(color: MyColors.mBlack),
              onPressed: () {},
              highlightedBorderColor: MyColors.mBlack,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/github.png',
                        fit: BoxFit.fill,
                        height: 24.0,
                        width: 24.0,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "GIT REPO",
                        style: TextStyle(color: MyColors.mBlack),
                      ),
                    ],
                  ),
                ),
              ),
            ))
          ],
        )
      ],
    );
  }
}
