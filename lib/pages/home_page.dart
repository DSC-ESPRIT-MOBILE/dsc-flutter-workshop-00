import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:workshop0/pages/deatails.dart';
import 'package:workshop0/utlis/my_colors.dart';

class HomePage extends StatefulWidget {
  final String username;
  HomePage(this.username);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: HomeContent(widget.username),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatefulWidget {
  final String username;
  HeaderWidget(this.username);
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          backgroundColor: MyColors.mBlue,
          radius: 22,
          child: Text(
            "${widget.username[0].toUpperCase()}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 14.0,
        ),
        Text(
          widget.username,
          style: TextStyle(
              color: MyColors.mBlack,
              fontWeight: FontWeight.w300,
              fontSize: 20),
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              FeatherIcons.logOut,
              color: MyColors.mRed,
            ),
            onPressed: null)
      ],
    );
  }
}

class WorkShopCard extends StatefulWidget {
  final String title, status, date, time;
  WorkShopCard(this.title, this.status, this.date, this.time);
  @override
  _WorkShopCardState createState() => _WorkShopCardState();
}

class _WorkShopCardState extends State<WorkShopCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      elevation: 8.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => DetailsPage()));
        },
        splashColor: MyColors.textFieldBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: MyColors.mBlue, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    widget.status,
                    style: TextStyle(
                        color: widget.status == "ENDED"
                            ? MyColors.mRed
                            : widget.status == "ON GOING"
                                ? MyColors.mYellow
                                : MyColors.mGreen,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FeatherIcons.calendar,
                        color: MyColors.mBlack,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        widget.date,
                        style: TextStyle(color: MyColors.mBlack),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FeatherIcons.clock,
                        color: MyColors.mBlack,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        widget.time,
                        style: TextStyle(color: MyColors.mBlack),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  final String username;
  HomeContent(this.username);
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(widget.username),
        SizedBox(height: 22.0),
        WorkShopCard("Session 00", "ENDED", "Mon Nov. 2nd 2020", "18:30"),
        SizedBox(
          height: 12.0,
        ),
        WorkShopCard("Session 01", "ON GOING", "Mon Nov. 11th 2020", "18:30"),
        SizedBox(
          height: 12.0,
        ),
        WorkShopCard("Session 02", "NOT STARTED", "TBA", "18:30"),
      ],
    );
  }
}
