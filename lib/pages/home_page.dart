import 'package:flutter/material.dart';

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

class HomeContent extends StatefulWidget {
  final String username;
  HomeContent(this.username);
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(widget.username),
      ),
    );
  }
}
